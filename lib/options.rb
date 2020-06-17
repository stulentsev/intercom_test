require 'optparse'

class Options
  def self.parse_commandline_arguments
    {}.tap do |options|
      OptionParser.new do |opts|
        opts.banner = "Usage: main.rb [options]"

        opts.on("--input FILENAME", "File to read data from. If not specified, data will be read from standard input") do |v|
          raise "File #{v} does not exist" unless File.exists?(v)
          options[:input_filename] = v
        end

        opts.on("--output FILENAME", "File to write data to. If not specified, data will be written to standard output") do |v|
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
    end
  end
end
