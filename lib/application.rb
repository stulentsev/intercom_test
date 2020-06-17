class Application
  def self.run(options)
    search_radius_km = options.search_radius || 100.0
    input_io = if options.input_filename.nil?
                 StdinLoader.new
               else
                 FileLoader.new(filename: options.input_filename)
               end
    output_io = if options.output_filename.nil?
                  StdoutWriter.new
                else
                  File.delete(options.output_filename) if File.exists?(options.output_filename)
                  FileWriter.new(filename: options.output_filename)
                end

    office_location = GeoPosition.new(latitude: 53.339428, longitude: -6.257664)
    search_result = CustomerSearch.new(
        customer_reader: CustomerReader.new(line_reader: input_io),
        search_radius_km: search_radius_km,
        origin: office_location,
    ).call

    if search_result.empty?
      puts "No customers within #{search_radius_km} km of #{office_location}"
      exit
    end

    output_io.bulk_write do |writer|
      customer_writer = CustomerFormatter.new(writer: writer)
      search_result.write_to(customer_writer: customer_writer)
    end
  end
end