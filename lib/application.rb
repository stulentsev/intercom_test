class Application
  def self.run(options)
    search_radius_km = options.search_radius || 100.0
    input_io = make_input_io(options)
    output_io = make_output_io(options)

    office_location = GeoPosition.new(latitude: 53.339428, longitude: -6.257664)
    search_result = CustomerSearch.new(
        customer_reader: CustomerReader.new(line_reader: input_io),
        search_radius_km: search_radius_km,
        origin: office_location,
    ).call

    if search_result.empty?
      puts "No customers within #{search_radius_km} km of #{office_location}"
      return
    end

    output_io.bulk_write do |writer|
      search_result.write_to(customer_writer: CustomerFormatter.new(line_writer: writer))
    end
  end

  private_class_method def self.make_output_io(options)
    if options.output_filename.nil?
      StdoutWriter.new
    else
      File.delete(options.output_filename) if File.exists?(options.output_filename)
      FileWriter.new(filename: options.output_filename)
    end
  end

  private_class_method def self.make_input_io(options)
    if options.input_filename.nil?
      StdinLoader.new
    else
      FileLoader.new(filename: options.input_filename)
    end
  end
end