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

  describe '#write_to' do
    let(:writer) { [] }

    it 'sorts customers by user_id' do
      expect {
        customer_search_result.write_to(customer_writer: writer)
      }.to change {
        writer.map(&:user_id)
      }.from([]).to([1, 2, 3])
    end
  end
end