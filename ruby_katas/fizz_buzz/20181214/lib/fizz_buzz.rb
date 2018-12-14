class FizzBuzz
  FIZZ = 'Fizz'
  BUZZ = 'Buzz'

  def initialize(check_digit: false)
    @check_digit = check_digit
  end

  def call(input)
    return execute(input) if input.kind_of?(Numeric)
    input.map { |n| execute(n) }
  end

  private

  def execute(input)
    return FIZZ+BUZZ  if fizz?(input) && buzz?(input)
    return FIZZ  if fizz?(input)
    return BUZZ  if buzz?(input)
    input
  end

  def fizz?(input)
    input % 3 == 0 || input.to_s.include?('3') && @check_digit
  end

  def buzz?(input)
    input % 5 == 0 || input.to_s.include?('5') && @check_digit
  end
end
