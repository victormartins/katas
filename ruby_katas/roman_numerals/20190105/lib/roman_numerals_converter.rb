require 'contracts'

module RomanNumerals
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
end

class ArabicToRoman
  include RomanNumerals

  def call(number)
    return execute(number) if number >=0
    result = execute(number * -1)
    "-#{result}"
  end

  private

  def execute(number)
    remainder = number
    result = ''

    while remainder > 0
      char_val_tupple = ROMAN_NUMERALS.detect do |char, val|
        val <= remainder
      end

      char = char_val_tupple[0]
      val = char_val_tupple[1]

      remainder -= val
      result << char
    end

    result
  end
end

class RomanToNumeric
  include RomanNumerals

  def call(roman)
    return execute(roman) unless roman.start_with?('-')
    result = execute(roman.sub('-', ''))
    result * -1
  end

  private

  def execute(roman)
    result = 0
    roman.chars.each.with_index do |char, index|
      val = ROMAN_NUMERALS[char]
      next_val = ROMAN_NUMERALS[roman[index + 1]]

      if(next_val && next_val > val)
        result -= val
      else
        result += val
      end

    end
    result
  end
end

class RomanNumeralsConverter
  include Contracts::Core
  include Contracts::Builtin


  def convert(number)
    return ArabicToRoman.new.(number) if number.kind_of?(Numeric)
    RomanToNumeric.new.(number)
  end
end
