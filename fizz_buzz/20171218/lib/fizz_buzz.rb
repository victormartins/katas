class FizzBuzz
  FIZZ = 'Fizz'.freeze
  BUZZ = 'Buzz'.freeze

  def initialize(options={})
    @extra = options.fetch(:extra) { false }
  end

  def call(input)
    return process_number(input) if input.is_a?(Numeric)
    input.map { |number| process_number(number) }
  end

  def process_number(input)
    return FIZZ + BUZZ if div_by?(input, 3, 5)
    return FIZZ if div_by?(input, 3)
    return BUZZ if div_by?(input, 5)
    return FIZZ if has_digit?(input, 3) if @extra
    return BUZZ if has_digit?(input, 5) if @extra
    input
  end

  private

  def div_by?(number, *divs)
    divs.map { |div| number % div == 0 }.all?
  end

  def has_digit?(input, digit)
    input.to_s.include?(digit.to_s)
  end
end
