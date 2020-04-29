# frozen_string_literal: true

class FizzBuzz
  FIZZ = 'Fizz'
  BUZZ = 'Buzz'

  def initialize(options={})
    @check_digit = options.fetch(:check_digit, false)
  end

  def call(input)
    return input.map { |i| execute(i) } if input.is_a?(Array)

    execute(input)
  end

  private

  attr_reader :check_digit

  def execute(input)
    return FIZZ + BUZZ if fizz?(input) && buzz?(input)
    return BUZZ if buzz?(input) || check_digit && input.to_s.include?('5')
    return FIZZ if fizz?(input) || check_digit && input.to_s.include?('3')

    input
  end

  def fizz?(input)
    input % 3 == 0
  end

  def buzz?(input)
    input % 5 == 0
  end
end
