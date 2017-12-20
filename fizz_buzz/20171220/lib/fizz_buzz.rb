class FizzBuzz
  FIZZ = 'Fizz'.freeze
  BUZZ = 'Buzz'.freeze

  def initialize(options={})
    @check_digit = options.fetch(:check_digit) { false }
  end

  def call(input)
   return  process(input) if input.is_a?(Integer)
   input.map { |number| process(number) }
  end

  private

  def process(number)
    return FIZZ + BUZZ if div_by?(number, 3, 5)
    return FIZZ if div_by?(number, 3)
    return BUZZ if div_by?(number, 5)
    return FIZZ if has_digit?(number, 3) if @check_digit
    return BUZZ if has_digit?(number, 5) if @check_digit
    number
  end

  def div_by?(number, *divs)
    divs.map { |div| number % div == 0 }.all?
  end

  def has_digit?(number, digit)
    number.to_s.include?(digit.to_s)
  end
end
