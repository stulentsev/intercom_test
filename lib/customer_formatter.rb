require 'json'

class CustomerFormatter
  # @param line_writer [ #<< ] an IO-like object
  def initialize(line_writer:)
    @line_writer = line_writer
  end

  def <<(customer)
    selected_attributes = [
        customer.user_id,
        customer.name,
    ]
    line_writer << selected_attributes.join(',') + "\n"
  end

  private

  attr_reader :line_writer
end