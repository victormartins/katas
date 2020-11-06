# frozen_string_literal: true

require 'grade'

RSpec.describe Grade do
  describe 'Comparing Grades' do
    describe '#greater_than?' do
      it 'compares correctly A+ with A' do
        expect(described_class.new('A+').greater_than?('A')).to be(true)
        expect(described_class.new('A+').greater_than?(described_class.new('A'))).to be(true)

        expect(described_class.new('A').greater_than?('A+')).to be(false)
        expect(described_class.new('A').greater_than?(described_class.new('A+'))).to be(false)
      end

      it 'compares correctly A+ with A-' do
        expect(described_class.new('A+').greater_than?('A-')).to be(true)
        expect(described_class.new('A+').greater_than?(described_class.new('A-'))).to be(true)

        expect(described_class.new('A-').greater_than?('A+')).to be(false)
        expect(described_class.new('A-').greater_than?(described_class.new('A+'))).to be(false)
      end

      it 'compares correctly A- with B+' do
        expect(described_class.new('A-').greater_than?('B+')).to be(true)
        expect(described_class.new('A-').greater_than?(described_class.new('B+'))).to be(true)

        expect(described_class.new('B+').greater_than?('A-')).to be(false)
        expect(described_class.new('B+').greater_than?(described_class.new('A-'))).to be(false)
      end
    end

    describe '#lesser_than?' do
      it 'compares correctly A+ with A-' do
        expect(described_class.new('A-').lesser_than?('A+')).to be(true)
        expect(described_class.new('A-').lesser_than?(described_class.new('A+'))).to be(true)

        expect(described_class.new('A+').lesser_than?('A-')).to be(false)
        expect(described_class.new('A+').lesser_than?(described_class.new('A-'))).to be(false)
      end

      it 'compares correctly A- with A' do
        expect(described_class.new('A-').lesser_than?('A')).to be(true)
        expect(described_class.new('A-').lesser_than?(described_class.new('A'))).to be(true)

        expect(described_class.new('A').lesser_than?('A-')).to be(false)
        expect(described_class.new('A').lesser_than?(described_class.new('A-'))).to be(false)
      end

      it 'compares correctly A with A+' do
        expect(described_class.new('A').lesser_than?('A+')).to be(true)
        expect(described_class.new('A').lesser_than?(described_class.new('A+'))).to be(true)

        expect(described_class.new('A+').lesser_than?('A')).to be(false)
        expect(described_class.new('A+').lesser_than?(described_class.new('A'))).to be(false)
      end
    end


    it 'compares correctly A- with A-' do
      expect(described_class.new('A-') == 'A-').to be(true)
      expect(described_class.new('A-') == 'A').to be(false)
      expect(described_class.new('A-') == 'A+').to be(false)
      expect(described_class.new('A+') == 'A-').to be(false)
    end

    it 'parses correctly to a string' do
      expect("#{described_class.new('A-')}" == 'A-').to be(true)
    end
  end

  describe '.for' do
    it 'converts a string into a Grade' do
      result = described_class.for('A-')

      expect(result).to be_kind_of(Grade)
      expect(result.letter).to eql('A')
      expect(result.sign).to eql('-')
    end

    it 'returns a grade if the input is a grade' do
      grade = described_class.for('A+')
      result = described_class.for(grade)

      expect(result).to be_kind_of(Grade)
      expect(result.letter).to eql('A')
      expect(result.sign).to eql('+')

    end
  end
end
