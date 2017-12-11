class FizzBuzz
  FIZZ = 'Fizz'.freeze
  BUZZ = 'Buzz'.freeze

  def initialize(options = {})
    @extra = options[:extra]
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
    return FIZZ if includes?(number, 3) if @extra
    return BUZZ if includes?(number, 5) if @extra
    number
  end

  def div_by?(number, *divisible)
    divisible.map { |div| number % div == 0 }.all?
  end

  def includes?(number, val)
    number.to_s.include?(val.to_s)
  end
end
