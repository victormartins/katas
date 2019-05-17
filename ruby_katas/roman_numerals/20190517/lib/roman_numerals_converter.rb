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

  def initialize
    @arabic_to_roman = ArabicToRoman.new
    @roman_to_arabic = RomanToArabic.new
  end

  def convert(number)
    return arabic_to_roman.call(number) if number.kind_of?(Numeric)
    roman_to_arabic.call(number)
  end

  private

  attr_reader :arabic_to_roman, :roman_to_arabic
end

class RomanToArabic
  include RomanNumerals

  def call(roman)
    return execute(roman) unless roman.start_with?('-')
    -execute(roman.sub('-', ''))
  end

  def execute(roman)
    roman.chars.each.with_index.inject(0) do |result, char_index|
      char = char_index[0]
      index = char_index[1]

      value = ROMAN_NUMERALS[char]
      next_value = ROMAN_NUMERALS[roman[index + 1]]

      if(next_value && next_value > value)
        result -= value
      else
        result += value
      end

    end
  end
end

class  ArabicToRoman
  include RomanNumerals

  def call(number)
    return execute(number) if number >= 0
    "-#{execute(-number)}"
  end

  def execute(number)
    result = ''
    remainder = number

    while(remainder > 0) do
      roman_value = ROMAN_NUMERALS.detect do |r_v|
        value = r_v[1]
        value <= remainder
      end

      roman = roman_value[0]
      value = roman_value[1]

      remainder -= value

      result << roman
    end

    result
  end
end
