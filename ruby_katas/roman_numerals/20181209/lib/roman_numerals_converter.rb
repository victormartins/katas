require 'contracts'

class RomanNumeralsConverter
  include Contracts::Core
  include Contracts::Builtin

  ROMAN_NUMERALS = {
    'M'  => 1000,
    'CM' => 900,
    'D'  => 500,
    'CD' => 400,
    'C'  => 100,
    'XC' => 90,
    'L'  => 50,
    'XL' => 40,
    'X'  => 10,
    'IX' => 9,
    'V'  => 5,
    'IV' => 4,
    'I'  => 1
  }

  def convert(number)
    require 'logger'
    @logger = Logger.new(STDOUT)

    if(number < 0)
      number *= -1
      result = convert_arabic_to_roman(number)
      result = "-#{result}"
    else
      result = convert_arabic_to_roman(number)
    end
    result
  end

  private

  attr_reader :logger

  # Example:
  # 20
  # find closest <= 20 in roman...
  # Found X
  # add X to result
  # subtract 10

  # 10
  # find closest <= 10 in roman...
  # Found X
  # add X to result
  # subtract 10
  def convert_arabic_to_roman(number)
    result = ''
    leftover = number
    while(leftover > 0) do
      key_value = ROMAN_NUMERALS.each_pair.detect { |k, v| v <= leftover }
      result << key_value[0]
      leftover = leftover - key_value[1]
    end
    result
  end
end

