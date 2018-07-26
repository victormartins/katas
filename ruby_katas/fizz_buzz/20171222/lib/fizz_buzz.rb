class FizzBuzz
  require 'contracts'
  include Contracts::Core
  include Contracts::Builtin

  FIZZ = 'Fizz'.freeze
  BUZZ = 'Buzz'.freeze

  def initialize(options={})
    @check_digit = options.fetch(:check_digit) { false }
  end

  Contract(Or[Num, ArrayOf[Num]] => Or[String, Num, ArrayOf[Or[String, Num]]])
  def call(input)
    return process(input) if input.is_a?(Integer)
    input.map { |number| process(number) }
  end

  Contract(Num => Or[String, Num, ArrayOf[Or[String, Num]]])
  def process(input)
    return FIZZ + BUZZ if div_by?(input, 3, 5)
    return FIZZ if div_by?(input, 3)
    return BUZZ if div_by?(input, 5)
    return FIZZ if has_digit?(input, 3) if @check_digit
    return BUZZ if has_digit?(input, 5) if @check_digit
    input
  end

  private

  def div_by?(input, *divs)
    divs.map { |div| input % div == 0 }.all?
  end

  def has_digit?(input, digit)
    input.to_s.include?(digit.to_s)
  end
end
