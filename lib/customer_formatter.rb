require 'json'

class CustomerFormatter
  # @param line_writer [ #<< ] an IO-like object
  def initialize(line_writer:)
    raise ArgumentError, "line_writer can't be nil" unless line_writer
    raise ArgumentError, "line_writer does not respond to method <<" unless line_writer.respond_to?(:<<)
    @line_writer = line_writer
  end

  def <<(customer)
    raise ArgumentError, "customer can't be nil" unless customer

    selected_attributes = [
        customer.user_id,
        customer.name,
    ]
    line_writer << selected_attributes.join(',') + "\n"
  end

  private

  attr_reader :line_writer
end