require_relative './../lib/roman_numerals_converter'

RSpec.describe RomanNumeralsConverter do
  context 'converting roman to arabic' do
    it { expect(subject.convert('I')).to eq(1) }
    it { expect(subject.convert('III')).to eq(3) }
    it { expect(subject.convert('IV')).to eq(4) }
    it { expect(subject.convert('V')).to eq(5) }
    it { expect(subject.convert('VI')).to eq(6) }
    it { expect(subject.convert('VIII')).to eq(8) }
    it { expect(subject.convert('IX')).to eq(9) }
    it { expect(subject.convert('X')).to eq(10) }
    it { expect(subject.convert('XX')).to eq(20) }
    it { expect(subject.convert('XL')).to eq(40) }
    it { expect(subject.convert('L')).to eq(50) }
    it { expect(subject.convert('XC')).to eq(90) }
    it { expect(subject.convert('C')).to eq(100) }
    it { expect(subject.convert('CD')).to eq(400) }
    it { expect(subject.convert('D')).to eq(500) }
    it { expect(subject.convert('CM')).to eq(900) }
    it { expect(subject.convert('M')).to eq(1000) }
    it { expect(subject.convert('MMXIII')).to eq(2013) }
    it { expect(subject.convert('MMMCMXCIX')).to eq(3999) }
    it { expect(subject.convert('')).to eq(0) }
    it { expect(subject.convert('-I')).to eq(-1) }
  end

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

  context 'validating input' do
    it 'raises an error if it receives a Symbol' do
      expect { subject.convert(:III) }.to raise_error('Invalid Input!')
    end
  end

  context 'dealing with collections' do
    it { expect(subject.convert(['XX', 'IV'])).to eq([20, 4]) }
    it { expect(subject.convert([20, 4])).to eq(['XX', 'IV']) }
  end
end
