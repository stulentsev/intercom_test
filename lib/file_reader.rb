# typed: true
class FileReader
  include Enumerable

  def initialize(filename:)
    @filename = filename
  end

  def to_a
    each.to_a
  end

  def each(&block)
    return enum_for(:each) unless block_given?

    File.foreach(filename) do |line|
      block.call(clean_input_line(line))
    end
  end

  private

  attr_reader :filename

  def clean_input_line(line)
    line.chomp
  end
end