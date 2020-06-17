class FileLoader
  include Enumerable

  def initialize(filename:)
    raise ArgumentError, "filename can't be nil" unless filename
    raise ArgumentError, "specified file (#{filename.inspect}) does not exist" unless File.exists?(filename)

    @filename = filename
  end

  def to_a
    each.to_a
  end

  def each
    return enum_for(:each) unless block_given?

    File.foreach(filename) do |line|
      yield clean_input_line(line)
    end
  end

  private

  attr_reader :filename

  def clean_input_line(line)
    line.chomp
  end
end