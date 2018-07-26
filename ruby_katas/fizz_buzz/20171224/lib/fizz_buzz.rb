class Rules
  def initialize(input)
    @input = input
  end

  def div_by?(*divs)
    divs.map { |div| @input % div == 0 }.all?
  end

  def has_digit?(digit)
    @input.to_s.include?(digit.to_s)
  end
end

class FizzBuzz
  FIZZ = 'Fizz'.freeze
  BUZZ = 'Buzz'.freeze

  def initialize(options={})
    @check_digit = options.fetch(:check_digit) { false }
  end

  def call(input)
    return process(input) if input.is_a?(Integer)
    input.map { |num| process(num) }
  end

  def process(input)
    r = Rules.new(input)
    return FIZZ + BUZZ if r.div_by?(3, 5)
    return FIZZ if r.div_by?(3)
    return BUZZ if r.div_by?(5)
    return FIZZ if r.has_digit?(3) if @check_digit
    return BUZZ if r.has_digit?(5) if @check_digit
    input
  end
end
