class StdoutWriter
  def bulk_write
    yield STDOUT
  end
end