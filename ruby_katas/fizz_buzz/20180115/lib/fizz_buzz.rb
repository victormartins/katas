class FizzBuzzRules
  def initialize(input)
    @input = input
  end

  def div_by?(*nums)
    nums.map { |num| @input % num == 0 }.all?
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
    input.map { |input| process(input) }
  end

  def process(num)
    rules = FizzBuzzRules.new(num)

    return FIZZ + BUZZ if rules.div_by?(3, 5)
    return FIZZ if rules.div_by?(3)
    return BUZZ if rules.div_by?(5)
    return FIZZ if rules.has_digit?(3) if @check_digit
    return BUZZ if rules.has_digit?(5) if @check_digit
    num
  end
end
