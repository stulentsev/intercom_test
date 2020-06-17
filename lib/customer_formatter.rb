require 'json'

class CustomerFormatter
  # @param writer [ #<< ] an IO-like object
  def initialize(writer:)
    @writer = writer
  end

  def <<(customer)
    selected_attributes = {
        user_id: customer.user_id,
        name: customer.name
    }
    writer << selected_attributes.to_json + "\n"
  end

  private

  attr_reader :writer
end