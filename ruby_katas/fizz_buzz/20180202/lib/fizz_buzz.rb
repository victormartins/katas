class FizzBuzzRules
  def initialize(input)
    @input = input

    raise('Expecting an Integer') unless input.is_a?(Integer)
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
  FIZZ_DIV = 3.freeze

  BUZZ = 'Buzz'.freeze
  BUZZ_DIV = 5.freeze

  def initialize(options={})
    @check_digit = options.fetch(:check_digit) { false }
  end

  def call(input)
    return process(input) if input.is_a?(Integer)
    Array(input).map { |num| process(num) }
  end

  private

  def process(input)
    rules = FizzBuzzRules.new(input)

    return FIZZ+BUZZ if rules.div_by?(FIZZ_DIV, BUZZ_DIV)
    return FIZZ if rules.div_by?(FIZZ_DIV)
    return BUZZ if rules.div_by?(BUZZ_DIV)
    return FIZZ if rules.has_digit?(FIZZ_DIV) if @check_digit
    return BUZZ if rules.has_digit?(BUZZ_DIV) if @check_digit
    input
  end
end
