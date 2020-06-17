require 'spec_helper'

RSpec.describe FileLoader do
  subject { FileLoader.new(filename: 'data/customers.txt') }

  it 'is an enumerable' do
    expect(subject).to be_an Enumerable
  end

  describe '#each' do

    it 'returns an enum' do
      expect(subject.each).to be_an Enumerator
    end

    it 'reads all lines from the sample file' do
      lines = subject.to_a

      expect(lines.first).to eq '{"latitude": "52.986375", "user_id": 12, "name": "Christina McArdle", "longitude": "-6.043701"}'
      expect(lines.last).to eq '{"latitude": "52.833502", "user_id": 25, "name": "David Behan", "longitude": "-8.522366"}'
      expect(lines.size).to eq 32
    end

    it 'reads lines lazily' do
      expect(subject).to receive(:clean_input_line).once.and_call_original

      subject.each.first
    end
  end
end