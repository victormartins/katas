# frozen_string_literal: true

require 'grade'

RSpec.describe Grade do
  it 'compares correctly A+ with A' do
    expect(described_class.new('A+').greater_than?('A')).to be(true)
    expect(described_class.new('A+').greater_than?(described_class.new('A'))).to be(true)
  end

  it 'compares correctly A- with A' do
    expect(described_class.new('A-').lesser_than?('A')).to be(true)
    expect(described_class.new('A-').lesser_than?(described_class.new('A'))).to be(true)
  end

  it 'compares correctly A- with A-' do
    expect(described_class.new('A-') == 'A-').to be(true)
    expect(described_class.new('A-') == described_class.new('A-')).to be(true)
  end

  it 'parses correctly to a string' do
    expect("#{described_class.new('A-')}" == 'A-').to be(true)
  end
end
