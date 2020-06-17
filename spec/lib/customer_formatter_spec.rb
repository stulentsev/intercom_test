require 'spec_helper'

RSpec.describe CustomerFormatter do
  let(:line_writer) { [] }
  subject(:customer_formatter) { CustomerFormatter.new(line_writer: line_writer) }

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
  end
end