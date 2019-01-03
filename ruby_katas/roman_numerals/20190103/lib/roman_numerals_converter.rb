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

  def convert(number)
    return execute(number) if number >= 0
    result = execute(number * -1)
    "-#{result}"
  end

  private

  def execute(number)
    result = ''
    remainder = number

    while(remainder > 0)
      char_val_tupple = RomanNumerals::ROMAN_NUMERALS.detect do |char_val|
        val  = char_val[1]
        val <= remainder
      end

      char = char_val_tupple[0]
      val = char_val_tupple[1]

      result << char
      remainder -= val
    end

    result
  end
end

class RomanToArabic
  include RomanNumerals

  def convert(roman)
    return execute(roman) unless roman.start_with?('-')
    result = execute(roman.sub('-', ''))
    result * -1
  end

  private

  def execute(roman)
    result = 0
    roman.chars.each.with_index do |char, index|
      val = RomanNumerals::ROMAN_NUMERALS[char]
      next_val = RomanNumerals::ROMAN_NUMERALS[roman[index + 1]]

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
    return ArabicToRoman.new.convert(number) if number.kind_of?(Numeric)
    RomanToArabic.new.convert(number)
  end
end
