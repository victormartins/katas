require_relative './../roman_numerals_converter'

RSpec.describe RomanNumeralsConverter do
  context 'converting arabic to roman' do
    it { expect(subject.convert(1)).to eq('I') }
    xit { expect(subject.convert(3)).to eq('III') }
    xit { expect(subject.convert(4)).to eq('IV') }
    xit { expect(subject.convert(5)).to eq('VI') }
    xit { expect(subject.convert(8)).to eq('VIII') }
    xit { expect(subject.convert(9)).to eq('IX') }
    xit { expect(subject.convert(10)).to eq('X') }
  end
end
