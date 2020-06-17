require 'spec_helper'

RSpec.describe CustomerReader do
  let(:line_reader) {
    <<~JSON_SEQ.lines
      {"latitude": "53.807778", "user_id": 28, "name": "Charlie Halligan", "longitude": "-7.714444"}
      {"latitude": "53.4692815", "user_id": 7, "name": "Frank Kehoe", "longitude": "-9.436036"}
      {"latitude": "54.0894797", "user_id": 8, "name": "Eoin Ahearn", "longitude": "-6.18671"}
    JSON_SEQ
  }
  
  subject(:customer_reader) { CustomerReader.new(line_reader: line_reader)}

  it 'is an Enumerable' do
    expect(customer_reader).to be_an Enumerable
  end

  it 'raises error if line_reader is nil' do
    expect {
      CustomerReader.new(line_reader: nil)
    }.to raise_error(ArgumentError)
  end

  it 'converts json lines to Customer objects' do
    iter = customer_reader.each
    
    cus1 = iter.next
    expect(cus1.user_id).to eq 28
    expect(cus1.name).to eq 'Charlie Halligan'
    expect(cus1.position.latitude).to eq 53.807778
    expect(cus1.position.longitude).to eq -7.714444
    
    cus2 = iter.next
    expect(cus2.user_id).to eq 7
    expect(cus2.name).to eq 'Frank Kehoe'
    expect(cus2.position.latitude).to eq 53.4692815
    expect(cus2.position.longitude).to eq -9.436036
    
    cus3 = iter.next
    expect(cus3.user_id).to eq 8
    expect(cus3.name).to eq 'Eoin Ahearn'
    expect(cus3.position.latitude).to eq 54.0894797
    expect(cus3.position.longitude).to eq -6.18671

    expect { iter.next }.to raise_error StopIteration
  end
end