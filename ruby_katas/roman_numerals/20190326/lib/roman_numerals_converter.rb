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
  }.freeze
end

class RomanNumeralsConverter
  include Contracts::Core
  include Contracts::Builtin

  def convert(number)
    return ArabicToRoman.new.call(number) if number.is_a?(Numeric)
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

    while remainder > 0
      # Find the lowest roman value pair for a remainder value
      roman_val = ROMAN_NUMERALS.detect do |r_v|
        v = r_v[1]
        v <= remainder
      end

      char = roman_val[0]
      val = roman_val[1]

      result << char
      remainder -= val
    end

    result
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
      char = char_index[0]
      index = char_index[1]

      val = ROMAN_NUMERALS[char]
      next_val = ROMAN_NUMERALS[roman[index + 1]]

      if next_val && next_val > val
        result -= val
      else
        result += val
      end
    end
  end
end
