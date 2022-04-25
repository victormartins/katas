require_relative './../lib/roman_numerals_converter'

RSpec.describe RomanNumeralsConverter do
  context 'converting roman to arabic' do
    it('converting I')         { expect(subject.convert('I')).to eq(1) }
    it('converting III')       { expect(subject.convert('III')).to eq(3) }
    it('converting IV')        { expect(subject.convert('IV')).to eq(4) }
    it('converting V')         { expect(subject.convert('V')).to eq(5) }
    it('converting VI')        { expect(subject.convert('VI')).to eq(6) }
    it('converting VIII')      { expect(subject.convert('VIII')).to eq(8) }
    it('converting IX')        { expect(subject.convert('IX')).to eq(9) }
    it('converting X')         { expect(subject.convert('X')).to eq(10) }
    it('converting XX')        { expect(subject.convert('XX')).to eq(20) }
    it('converting XL')        { expect(subject.convert('XL')).to eq(40) }
    it('converting L')         { expect(subject.convert('L')).to eq(50) }
    it('converting XC')        { expect(subject.convert('XC')).to eq(90) }
    it('converting C')         { expect(subject.convert('C')).to eq(100) }
    it('converting CD')        { expect(subject.convert('CD')).to eq(400) }
    it('converting D')         { expect(subject.convert('D')).to eq(500) }
    it('converting CM')        { expect(subject.convert('CM')).to eq(900) }
    it('converting M')         { expect(subject.convert('M')).to eq(1000) }
    it('converting MMXIII')    { expect(subject.convert('MMXIII')).to eq(2013) }
    it('converting MMMCMXCIX') { expect(subject.convert('MMMCMXCIX')).to eq(3999) }
    it('converting ""')        { expect(subject.convert('')).to eq(0) }
    it('converting -I')        { expect(subject.convert('-I')).to eq(-1) }
  end

  context 'converting arabic to roman' do
    it('converting 1')    { expect(subject.convert(1)).to eq('I') }
    it('converting 3')    { expect(subject.convert(3)).to eq('III') }
    it('converting 4')    { expect(subject.convert(4)).to eq('IV') }
    it('converting 5')    { expect(subject.convert(5)).to eq('V') }
    it('converting 6')    { expect(subject.convert(6)).to eq('VI') }
    it('converting 8')    { expect(subject.convert(8)).to eq('VIII') }
    it('converting 9')    { expect(subject.convert(9)).to eq('IX') }
    it('converting 10')   { expect(subject.convert(10)).to eq('X') }
    it('converting 20')   { expect(subject.convert(20)).to eq('XX') }
    it('converting 23')   { expect(subject.convert(23)).to eq('XXIII') }
    it('converting 40')   { expect(subject.convert(40)).to eq('XL') }
    it('converting 50')   { expect(subject.convert(50)).to eq('L') }
    it('converting 90')   { expect(subject.convert(90)).to eq('XC') }
    it('converting 100')  { expect(subject.convert(100)).to eq('C') }
    it('converting 400')  { expect(subject.convert(400)).to eq('CD') }
    it('converting 500')  { expect(subject.convert(500)).to eq('D') }
    it('converting 900')  { expect(subject.convert(900)).to eq('CM') }
    it('converting 1000') { expect(subject.convert(1000)).to eq('M') }
    it('converting 2013') { expect(subject.convert(2013)).to eq('MMXIII') }
    it('converting 3999') { expect(subject.convert(3999)).to eq('MMMCMXCIX') }
    it('converting 0')    { expect(subject.convert(0)).to eq('') }
    it('converting -I')   { expect(subject.convert(-1)).to eq('-I') }
  end

  context 'validating input' do
    it 'raises an error if it receives a Symbol' do
      expect { subject.convert(:III) }.to raise_error(/Invalid Input!/)
    end
  end

  context 'dealing with collections' do
    it('converting [XX, IV]') { expect(subject.convert(%w[XX IV])).to eq([20, 4]) }
    it('converting [20, 4]')  { expect(subject.convert([20, 4])).to eq(%w[XX IV]) }
  end
end
