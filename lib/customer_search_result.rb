class CustomerSearchResult
  include Enumerable

  attr_reader :customers

  def initialize(customers:)
    raise ArgumentError, "customers can't be nil" unless customers

    @customers = customers
  end

  def each(&block)
    customers.each(&block)
  end

  def empty?
    customers.empty?
  end

  def write_to(customer_writer:)
    customers.sort_by(&:user_id).each do |customer|
      customer_writer << customer
    end
  end
end