class OptimizedFizzBuzzRules
  def self.div_by?(input, *divs)
    divs.map { |div| input % div == 0 }.all?
  end

  def self.has_digit?(input, digit)
    input.to_s.include?(digit.to_s)
  end
end

class OptimizedFizzBuzz
  FIZZ = 'Fizz'.freeze
  BUZZ = 'Buzz'.freeze
  FIZZBUZZ = (FIZZ + BUZZ).freeze
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

  attr_reader :check_digit, :rules

  def process(input)
    return FIZZBUZZ if rules.div_by?(input, FIZZ_DIG, BUZZ_DIG)
    return FIZZ if rules.div_by?(input, FIZZ_DIG)
    return BUZZ if rules.div_by?(input, BUZZ_DIG)

    if check_digit
      return FIZZ if rules.has_digit?(input, FIZZ_DIG)
      return BUZZ if rules.has_digit?(input, BUZZ_DIG)
    end
    input
  end

  def rules
    OptimizedFizzBuzzRules
  end
end
