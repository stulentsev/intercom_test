require 'json'

class CustomerFormatter
  # @param writer [ #<< ] an IO-like object
  def initialize(writer:)
    @writer = writer
  end

  def <<(customer)
    selected_attributes = [
        customer.user_id,
        customer.name,
    ]
    writer << selected_attributes.join(',') + "\n"
  end

  private

  attr_reader :writer
end