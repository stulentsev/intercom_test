class FileWriter
  attr_reader :filename

  def initialize(filename:)
    @filename = filename
  end

  def bulk_write
    File.open(filename, 'w') do |file|
      yield file
    end
  end
end