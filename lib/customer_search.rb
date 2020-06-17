require './lib/customer'

class CustomerSearch
  attr_reader :search_radius_km, :origin
  
  def initialize(customer_reader:, search_radius_km: 100, origin: )
    raise ArgumentError, "customer_reader can't be nil" unless customer_reader
    raise ArgumentError, "search_radius_km can't be nil" unless search_radius_km
    raise ArgumentError, "origin can't be nil" unless origin

    @customer_reader = customer_reader
    @search_radius_km = search_radius_km
    @origin = origin
  end

  def call
    filtered_customers = customer_reader.select do |customer|
      origin.distance_in_km_to(customer.position) <= search_radius_km
    end

    CustomerSearchResult.new(customers: filtered_customers)
  end
  
  private
  
  attr_reader :customer_reader
end