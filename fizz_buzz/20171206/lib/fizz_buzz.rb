class FizzBuzz
  FIZZ = 'Fizz'
  BUZZ = 'Buzz'

  def initialize(options={})
    @extra = options.fetch(:extra) { false }
  end

  def call(input)
    return process(input) if input.is_a?(Integer)
    input.map { |n| process(n) }
  end

  def process(number)
    return FIZZ+BUZZ if div_by?(number, 3, 5)
    return FIZZ if div_by?(number, 3)
    return BUZZ if div_by?(number, 5)
    return FIZZ if number.to_s =~ /3/ if @extra
    return BUZZ if number.to_s =~ /5/ if @extra
    number
  end

  private

  def div_by?(number, *dividers)
    dividers.map { |d| number % d == 0 }.all?
  end
end
