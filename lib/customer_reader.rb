require 'json'

class CustomerReader
  include Enumerable

  def initialize(line_reader:)
    @line_reader = line_reader
  end

  def each
    return enum_for(:each) unless block_given?

    line_reader.each do |line|
      json_obj = JSON.parse(line)
      user_id, name, latitude, longitude = json_obj.values_at('user_id', 'name', 'latitude', 'longitude')
      customer = Customer.new(
          user_id: user_id,
          name: name,
          position: GeoPosition.new(latitude: Float(latitude), longitude: Float(longitude)),
      )
      yield customer
    end
  end

  private

  attr_reader :line_reader
end