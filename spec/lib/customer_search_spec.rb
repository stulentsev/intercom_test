require 'spec_helper'

RSpec.describe CustomerSearch do
  it { is_expected.to be_a CustomerSearch }

  let(:customer_reader) { [] }
  let(:search_radium_km) { 1 }

  subject(:customer_search) {
    CustomerSearch.new(
        customer_reader: customer_reader,
        search_radius_km: search_radium_km,
        origin: GeoPosition.new(latitude: 53.339428, longitude: -6.257664),
    )
  }

  describe '#call' do
    let(:customer_reader) {
      [
          Customer.new(user_id: 1, position: GeoPosition.new(latitude: 53.339441, longitude: -6.255862), name: nil),
          Customer.new(user_id: 2, position: GeoPosition.new(latitude: 53.339624, longitude: -6.258410), name: nil),
          Customer.new(user_id: 3, position: GeoPosition.new(latitude: 53.328153, longitude: -6.229335), name: nil),
      ]
    }

    it 'selects only customers within radius' do
      nearby_customers = customer_search.call
      expect(nearby_customers.map(&:user_id)).to match_array([1, 2])
    end

    it 'returns a CustomerSearchResult' do
      expect(customer_search.call).to be_a CustomerSearchResult
    end
  end

end