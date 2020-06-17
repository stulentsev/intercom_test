class CustomerSearchResult
  attr_reader :customers

  def initialize(customers:)
    @customers = customers
  end

  def write_to(customer_writer:)
    customers.sort_by(&:user_id).each do |customer|
      customer_writer << customer
    end
  end
end