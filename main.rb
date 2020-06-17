#! /usr/bin/env ruby

# eager-loading
$LOAD_PATH.unshift '.'
Dir.glob('lib/*.rb').each do |file|
  require file
end

if __FILE__ == $0
  require 'optparse'

  options = {}
  OptionParser.new do |opts|
    opts.banner = "Usage: main.rb [options]"

    opts.on("--input FILENAME", "File to read data from. If not specified, data will be read from standard input") do |v|
      raise "File #{v} does not exist" unless File.exists?(v)
      options[:input_filename] = v
    end

    opts.on("--output FILENAME", "File to write data to. If not specified, data will be written to standard output") do |v|
      raise "File #{v} does not exist" unless File.exists?(v)
      options[:output_filename] = v
    end

    opts.on("--radius KM", "Search radius in kilometers. Default is 100") do |v|
      options[:search_radius] = Float(v)
    end

    opts.on("-h", "--help", "Prints this help") do
      puts opts
      exit
    end
  end.parse!

  search_radius_km = options[:search_radius] || 100.0
  input_io = if options[:input_filename].nil?
               STDIN
             else
               FileLoader.new(filename: options[:input_filename])
             end
  output_io = if options[:output_filename].nil?
                STDOUT
              else
                FileWriter.new(filename: options[:output_filename])
              end

  office_location = GeoPosition.new(latitude: 53.339428, longitude: -6.257664)
  search_result = CustomerSearch.new(
      customer_reader: CustomerReader.new(line_reader: input_io),
      search_radius_km: search_radius_km,
      origin: office_location,
  ).call

  if search_result.empty?
    puts "No customers within #{search_radius_km} km of #{office_location}"
  end
  customer_writer = CustomerFormatter.new(writer: output_io)
  search_result.write_to(customer_writer: customer_writer)
end
