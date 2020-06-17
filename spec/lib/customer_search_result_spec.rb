require 'spec_helper'

RSpec.describe CustomerSearchResult do
  let(:customers) {
    [
        Customer.new(user_id: 3, name: nil, position: nil),
        Customer.new(user_id: 1, name: nil, position: nil),
        Customer.new(user_id: 2, name: nil, position: nil),
    ]
  }

  subject(:customer_search_result) { CustomerSearchResult.new(customers: customers) }

  it 'requires customers param' do
    expect{
      CustomerSearchResult.new(customers: nil)
    }.to raise_error(ArgumentError)
  end

  it 'is an Enumerable' do
    expect(customer_search_result).to be_an Enumerable
  end

  describe '#write_to' do
    let(:line_writer) { [] }

    it 'sorts customers by user_id' do
      expect {
        customer_search_result.write_to(customer_writer: line_writer)
      }.to change {
        line_writer.map(&:user_id)
      }.from([]).to([1, 2, 3])
    end
  end

  describe '#empty?' do
    it 'is false when some customers are present' do
      expect(CustomerSearchResult.new(customers: [1]).empty?).to eq false
    end

    it 'is true when no customers are present' do
      expect(CustomerSearchResult.new(customers: []).empty?).to eq true
    end
  end
end