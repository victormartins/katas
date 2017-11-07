require_relative './../roman_numerals_converter'

RSpec.describe RomanNumeralsConverter do
  context 'converting arabic to roman' do
    it { expect(subject.convert(1)).to eq('I') }
    it { expect(subject.convert(3)).to eq('III') }
    xit { expect(subject.convert(4)).to eq('IV') }
    it { expect(subject.convert(5)).to eq('V') }
    it { expect(subject.convert(6)).to eq('VI') }
    it { expect(subject.convert(8)).to eq('VIII') }
    xit { expect(subject.convert(9)).to eq('IX') }
    it { expect(subject.convert(10)).to eq('X') }
    xit { expect(subject.convert(20)).to eq('XX') }
    xit { expect(subject.convert(40)).to eq('XL') }
    xit { expect(subject.convert(50)).to eq('L') }
    xit { expect(subject.convert(90)).to eq('XC') }
    xit { expect(subject.convert(100)).to eq('C') }
    xit { expect(subject.convert(400)).to eq('CD') }
    xit { expect(subject.convert(500)).to eq('D') }
    xit { expect(subject.convert(900)).to eq('CM') }
    xit { expect(subject.convert(1000)).to eq('M') }
    xit { expect(subject.convert(2013)).to eq('MMXIII') }
    xit { expect(subject.convert(3999)).to eq('MMMCMXCIX') }
    xit { expect(subject.convert(0)).to eq('') }
    xit { expect(subject.convert(-1)).to eq('-I') }
  end
end
