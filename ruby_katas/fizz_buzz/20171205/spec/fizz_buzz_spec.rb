require_relative './../lib/fizz_buzz'

RSpec.describe FizzBuzz do
  it 'returns "fizz" if number is dividable by 3' do
    expect(subject.call(3)).to eq('Fizz')
  end

  it 'returns "Buzz" if number is dividable by 5' do
    expect(subject.call(5)).to eq('Buzz')
  end

  it 'returns "FizzBuzz" if the number is dividable by 3 and 5' do
    expect(subject.call(15)).to eq('FizzBuzz')
  end

  it 'returns the number otherwise' do
    expect(subject.call(4)).to eq(4)
  end

  it 'returns an array if it receives an array' do
    input = (1..20)
    output = [
      1,  2,  'Fizz',     4,      'Buzz', 'Fizz',
      7,  8,  'Fizz',     'Buzz',  11,    'Fizz',
      13, 14, 'FizzBuzz', 16, 17, 'Fizz',  19, 'Buzz'
    ]
    expect(subject.call(input)).to eq(output)
  end

  context 'with :extra flag on' do
    subject { described_class.new(extra: true) }

    it 'returns "Fizz" if a number is divisable by 3 or has 3 on it' do
      expect(subject.call(13)).to eq('Fizz')
    end

    it 'returns "Buzz" if a number is divisable by 5 or has 5 on it' do
      expect(subject.call(52)).to eq('Buzz')
    end
  end
end
