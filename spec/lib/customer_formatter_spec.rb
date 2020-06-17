require 'spec_helper'

RSpec.describe CustomerFormatter do
  let(:line_writer) { [] }
  subject(:customer_formatter) { CustomerFormatter.new(line_writer: line_writer) }

  it 'raises error on nil line_writer' do
    expect{
      CustomerFormatter.new(line_writer: nil)
    }.to raise_error(ArgumentError)
  end

  it 'raises error if line_writer does not have expected interface' do
    expect {
      CustomerFormatter.new(line_writer: OpenStruct.new)
    }.to raise_error(ArgumentError)
  end

  describe '#<<' do
    it 'outputs only user_id and name' do
      customer = Customer.new(
          user_id: 1,
          name: 'Joe Smith',
          position: GeoPosition.new(latitude: 0, longitude: 0),
      )
      initial = []
      expected = ["1,Joe Smith\n"]


      expect {
        customer_formatter << customer
      }.to change { line_writer }.from(initial).to(expected)
    end

    it 'raises error when nil is passed' do
      expect{
        customer_formatter << nil
      }.to raise_error(ArgumentError)
    end

  end
end