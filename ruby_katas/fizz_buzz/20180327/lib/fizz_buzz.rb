class FizzBuzzRules
  def initialize(input)
    @input = input
  end

  def div_by?(*divs)
    divs.map { |div| input % div == 0 }.all?
  end

  def has_digit?(digit)
    input.to_s.include?(digit.to_s)
  end

  private

  attr_reader :input
end

class FizzBuzz
  FIZZ = 'Fizz'.freeze
  BUZZ = 'Buzz'.freeze
  FIZZ_DIG = 3
  BUZZ_DIG = 5

  def initialize(opts={})
    @check_digit = opts.fetch(:check_digit) { false }
  end

  def call(input)
    return input.map { |i| process(i) } if input.is_a?(Array)
    process(input)
  end

  private

  attr_reader :check_digit

  def process(input)
    rules = FizzBuzzRules.new(input)

    return FIZZ + BUZZ if rules.div_by?(FIZZ_DIG, BUZZ_DIG)
    return FIZZ if rules.div_by?(FIZZ_DIG)
    return BUZZ if rules.div_by?(BUZZ_DIG)
    return FIZZ if rules.has_digit?(FIZZ_DIG) if check_digit
    return BUZZ if rules.has_digit?(BUZZ_DIG) if check_digit
    input
  end
end
