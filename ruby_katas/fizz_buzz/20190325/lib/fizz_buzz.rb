class FizzBuzz
  FIZZ = 'Fizz'
  FIZZ_DIGIT = 3
  BUZZ = 'Buzz'
  BUZZ_DIGIT = 5

  def initialize(check_digit: false)
    @check_digit = check_digit
  end

  def call(input)
    return input.map { |i| execute(i) } if input.kind_of?(Array)
    execute(input)
  end

  def execute(input)
    return FIZZ + BUZZ if fizz?(input) && buzz?(input)
    return FIZZ if fizz?(input)
    return BUZZ if buzz?(input)
    input
  end

  def fizz?(input)
    rules(input, FIZZ_DIGIT)
  end

  def buzz?(input)
    rules(input, BUZZ_DIGIT)
  end

  def divides_by?(input, divider)
    input % divider == 0
  end

  def rules(input, digit)
    divides_by?(input, digit) || input.to_s.include?(digit.to_s) && @check_digit
  end
end
