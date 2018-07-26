class FizzBuzz
  FIZZ = 'Fizz'.freeze
  BUZZ = 'Buzz'.freeze

  def initialize(options={})
    @extra = options.fetch(:extra) { false }
  end

  def call(input)
    return process(input) if input.is_a?(Integer)
    input.map { |input| process(input) }
  end

  private

  def process(input)
    return FIZZ + BUZZ if div_by?(input, 3, 5)
    return FIZZ if div_by?(input, 3)
    return BUZZ if div_by?(input, 5)
    return FIZZ if contains_digit?(input, 3) if @extra
    return BUZZ if contains_digit?(input, 5) if @extra
    input
  end

  def div_by?(number, *divs)
    divs.map { |div| number % div == 0 }.all?
  end

  def contains_digit?(input, digit)
    input.to_s.include?(digit.to_s)
  end
end
