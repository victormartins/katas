class FizzBuzz
  FIZZ = 'Fizz'
  BUZZ = 'Buzz'
  FIZZ_DIGIT = 3
  BUZZ_DIGIT = 5

  def initialize(check_digit: false)
    @check_digit = check_digit
  end

  def call(input)
    return execute(input) if input.is_a?(Numeric)

    input.map { |i| execute(i) }
  end

  private

  def execute(input)
    return FIZZ + BUZZ if input % FIZZ_DIGIT == 0 && input % BUZZ_DIGIT == 0
    return FIZZ if input % FIZZ_DIGIT == 0 || @check_digit && input.to_s.include?(FIZZ_DIGIT.to_s)
    return BUZZ if input % BUZZ_DIGIT == 0 || @check_digit && input.to_s.include?(BUZZ_DIGIT.to_s)

    input
  end
end
