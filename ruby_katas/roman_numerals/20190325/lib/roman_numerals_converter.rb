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

class RomanNumeralsConverter
  include Contracts::Core
  include Contracts::Builtin

  def convert(number)
    return ArabicToRoman.new.call(number) if number.kind_of?(Numeric)
    RomanToArabic.new.call(number)
  end
end


class ArabicToRoman
  include RomanNumerals

  def call(number)
    return execute(number) if number >= 0
    "-#{execute(-number)}"
  end

  private

  def execute(number)
    result = ''
    remainder = number

    while(remainder >0)
      # Find the lowest numeral roman for a given number
      roman_val = find_lowest_roman_value_pair(remainder)

      # Add the roman char to the result
      char = roman_val[0]
      result << char

      val = roman_val[1]
      remainder -= val
    end

    result
  end

  def find_lowest_roman_value_pair(number)
    ROMAN_NUMERALS.find do |r_v|
      v = r_v[1]
      v <= number
    end
  end
end

class RomanToArabic
  include RomanNumerals

  def call(roman)
    return execute(roman) unless roman.start_with?('-')
    -execute(roman.sub('-', ''))
  end

  private

  def execute(roman)
    roman.chars.each.with_index.reduce(0) do |result, char_index|
      # find the numeral to add to the result
      char = char_index[0]
      val = ROMAN_NUMERALS[char]

      # check to see if we have to subtract or add the val to the result
      index = char_index[1]
      next_val = ROMAN_NUMERALS[roman[index+1]]

      if(next_val && next_val > val)
        result -= val
      else
        result += val
      end
    end
  end
end