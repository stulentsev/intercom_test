require './lib/customer'

class FileLoader
  def initialize(filename: )
    @filename = filename
  end

  def call
    Enumerator.new do |y|
      File.foreach(filename) do |line|
        y << clean_input_line(line)
      end
    end
  end

  private

  attr_reader :filename

  def clean_input_line(line)
    line.chomp
  end
end