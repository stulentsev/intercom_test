#! /usr/bin/env ruby

require 'bundler'
Bundler.require

# eager-loading
Dir.glob('lib/*.rb').each do |file|
  require_relative file
end

if __FILE__ == $PROGRAM_NAME
  options = Options.parse_commandline_arguments
  Application.run(options)
end