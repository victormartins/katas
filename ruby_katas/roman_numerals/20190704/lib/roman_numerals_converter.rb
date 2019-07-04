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

  def initialize
    @arabic_to_roman = ArabicToRoman.new(ROMAN_NUMERALS)
    @roman_to_arabic = RomanToArabic.new(ROMAN_NUMERALS)
  end

  def convert(number)
    return arabic_to_roman.call(number) if number.kind_of?(Numeric)
    roman_to_arabic.call(number)
  end

  private

  attr_reader :arabic_to_roman, :roman_to_arabic
end

class ArabicToRoman
  def initialize(roman_numerals)
    @roman_numerals = roman_numerals
  end

  def call(number)
    return execute(number) if number >= 0
    "-#{execute(-number)}"
  end

  private

  def execute(number)
    result = ''
    remainder = number

    while(remainder > 0)
      roman_arabic = @roman_numerals.find {|r_a| r_a[1] <= remainder}
      roman = roman_arabic[0]
      arabic = roman_arabic[1]

      result << roman
      remainder -= arabic
    end

    result
  end
end

class RomanToArabic
  def initialize(roman_numerals)
    @roman_numerals = roman_numerals
  end

  def call(roman)
    return execute(roman) unless roman.start_with?('-')
    -execute(roman.sub('-', ''))
  end

  private

  def execute(roman)
    roman.chars.each.with_index.reduce(0) do |result, char_index|
      char = char_index[0]
      index = char_index[1]
      value = @roman_numerals[char]
      next_value = @roman_numerals[roman[index+1]]

      if(next_value && next_value > value)
        result -= value
      else
        result += value
      end
    end
  end
end
