class FileWriter
  attr_reader :filename

  def initialize(filename:)
    @filename = filename
  end

  def <<(line)
    File.open(filename, 'a') do |file|
      file << line
    end
  end
end