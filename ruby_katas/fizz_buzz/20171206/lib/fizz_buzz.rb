# Class to encapsulate the FizzBuzz Logic
class FizzBuzz
  FIZZ = 'Fizz'
  BUZZ = 'Buzz'

  def initialize(options={})
    @extra = options.fetch(:extra) { false }
  end

  def call(input)
    return process(input) if input.is_a?(Integer)
    input.map { |number| process(number) }
  end

  private

  def process(number)
    by_division(number) || by_match(number) || number
  end

  def by_division(number)
    return FIZZ+BUZZ if div_by?(number, 3, 5)
    return FIZZ if div_by?(number, 3)
    return BUZZ if div_by?(number, 5)
  end

  def by_match(number)
    return FIZZ if has_digit?(number, 3) if @extra
    return BUZZ if has_digit?(number, 5) if @extra
  end

  def div_by?(number, *dividers)
    dividers.map { |divider| number % divider == 0 }.all?
  end

  def has_digit?(number, digit)
    number.to_s =~ /#{Regexp.quote(digit.to_s)}/
  end
end
