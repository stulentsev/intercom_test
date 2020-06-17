require 'spec_helper'

RSpec.describe GeoPosition do
  describe '#distance_in_km_to' do
    it 'calculates distance ~correctly' do
      origin = GeoPosition.new(latitude: 53.339428, longitude: -6.257664)
      point_of_interest = GeoPosition.new(latitude: 53.339441, longitude: -6.255862)
      distance = origin.distance_in_km_to(point_of_interest)

      expect(distance).to be_within(0.01).of(0.12)
    end
  end

  describe '#to_s' do
    it 'returns lat,lon' do
      expect(GeoPosition.new(latitude: 53.339428, longitude: -6.257664).to_s).to eq '53.339428,-6.257664'
    end
  end

end