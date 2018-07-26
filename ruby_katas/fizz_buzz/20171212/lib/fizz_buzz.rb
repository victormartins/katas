class FizzBuzz
  FIZZ = 'Fizz'.freeze
  BUZZ = 'Buzz'.freeze

  def initialize(options={})
    @extra = options.fetch(:extra) { false }
  end

  def call(input)
    return process(input) if input.is_a?(Integer)
    input.map { |number| process(number) }
  end

  private

  def process(number)
    return FIZZ + BUZZ if div_by?(number, 3, 5)
    return FIZZ if div_by?(number, 3)
    return BUZZ if div_by?(number, 5)
    return FIZZ if is_num_present?(number, 3) if @extra
    return BUZZ if is_num_present?(number, 5) if @extra
    number
  end

  def div_by?(number, *div)
    div.map { |d| number % d == 0 }.all?
  end

  def is_num_present?(number, check)
    number.to_s.include?(check.to_s)
  end
end
