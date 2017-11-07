require_relative './../roman_numerals_converter'

RSpec.describe RomanNumeralsConverter do
  context 'converting arabic to roman' do
    it { expect(subject.convert(1)).to eq('I') }
    it { expect(subject.convert(3)).to eq('III') }
    it { expect(subject.convert(4)).to eq('IV') }
    it { expect(subject.convert(5)).to eq('V') }
    it { expect(subject.convert(6)).to eq('VI') }
    it { expect(subject.convert(8)).to eq('VIII') }
    it { expect(subject.convert(9)).to eq('IX') }
    it { expect(subject.convert(10)).to eq('X') }
    it { expect(subject.convert(20)).to eq('XX') }
    it { expect(subject.convert(40)).to eq('XL') }
    it { expect(subject.convert(50)).to eq('L') }
    it { expect(subject.convert(90)).to eq('XC') }
    it { expect(subject.convert(100)).to eq('C') }
    it { expect(subject.convert(400)).to eq('CD') }
    it { expect(subject.convert(500)).to eq('D') }
    it { expect(subject.convert(900)).to eq('CM') }
    it { expect(subject.convert(1000)).to eq('M') }
    it { expect(subject.convert(2013)).to eq('MMXIII') }
    it { expect(subject.convert(3999)).to eq('MMMCMXCIX') }
    it { expect(subject.convert(0)).to eq('') }
    it { expect(subject.convert(-1)).to eq('-I') }
  end
end
