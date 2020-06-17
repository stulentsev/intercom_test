#! /usr/bin/env ruby

# eager-loading
$LOAD_PATH.unshift '.'
Dir.glob('lib/*.rb').each do |file|
  require file
end
