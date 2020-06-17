require './lib/customer'

class CustomerSearch

  attr_reader :search_radius_km, :origin
  
  def initialize(customer_reader:, search_radius_km: 100, origin: )
    @customer_reader = customer_reader
    @search_radius_km = search_radius_km
    @origin = origin
  end

  def call
    customer_reader.select do |customer|
      origin.distance_in_km_to(customer.position) <= search_radius_km
    end
  end
  
  private
  
  attr_reader :customer_reader
end