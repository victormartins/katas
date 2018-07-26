class FizzBuzz
  FIZZ     = 'Fizz'
  FIZZ_DIV = 3
  BUZZ     = 'Buzz'
  BUZZ_DIV = 5

  def initialize(options = {})
    @check_digit = options.fetch(:check_digit) { false }
  end

  def call(input)
    return input.map { |i| process(i) } if input.kind_of?(Array)
    process(input)
  end

  private

  def process(input)
    return FIZZ + BUZZ if div_by?(input, FIZZ_DIV, BUZZ_DIV)
    return FIZZ if div_by?(input, FIZZ_DIV)
    return BUZZ if div_by?(input, BUZZ_DIV)

    if @check_digit
      return FIZZ if has_digit?(input, FIZZ_DIV)
      return BUZZ if has_digit?(input, BUZZ_DIV)
    end

    input
  end

  def div_by?(input, *divs)
    divs.map { |div| input % div == 0 }.all?
  end

  def has_digit?(input, digit)
    input.to_s.include?(digit.to_s)
  end
end
