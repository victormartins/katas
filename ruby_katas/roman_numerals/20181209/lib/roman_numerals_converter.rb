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

    return roman_to_arabic(number) if number.kind_of?(String)
    arabic_to_roman(number)
  end

  private

  attr_reader :logger

  def roman_to_arabic(roman_number)
    return convert_roman_to_arabic(roman_number) unless (roman_number.start_with?('-'))

    roman_number = roman_number.sub('-', '')
    result = convert_roman_to_arabic(roman_number)
    result *= -1
  end

  def arabic_to_roman(number)
    return convert_arabic_to_roman(number) unless (number < 0)

    number *= -1
    result = convert_arabic_to_roman(number)
    "-#{result}"
  end

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

  # Example:
  # III
  # for each char, find val and add number
  # 1 + 1 + 1

  # IV
  # if next char is bigger than current char then substract
  # -1 + 5
  def convert_roman_to_arabic(roman_number)
    result = 0
    roman_number.each_char.with_index do |char, index|
      logger.info { "[#{self.class}] - char: #{char} index: #{index}" }
      char_value = ROMAN_NUMERALS[char]
      next_char_value =ROMAN_NUMERALS[roman_number[index+1]]

      if(next_char_value && next_char_value > char_value)
        result -= char_value
      else
        result += char_value
      end
    end
    result
  end
end

