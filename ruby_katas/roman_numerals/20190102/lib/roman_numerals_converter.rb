require 'contracts'

class ArabicToRoman
  attr_reader :roman_numerals

  def initialize(roman_numerals)
    @roman_numerals = roman_numerals
  end

  def call(arabic)
    return process(arabic) if arabic >= 0
    result = process(arabic * -1)
    "-#{result}"
  end

  private

  def process(arabic)
    result = ''
    remainder = arabic

    while(remainder > 0)
      selected_tupple = roman_numerals.detect do |char_val_tupple|
        char = char_val_tupple[0]
        val = char_val_tupple[1]
        val <= remainder
      end

      char = selected_tupple[0]
      val = selected_tupple[1]

      result << char
      remainder -= val
    end
    result
  end
end

class RomanToArabic
  attr_reader :roman_numerals

  def initialize(roman_numerals)
    @roman_numerals = roman_numerals
  end

  def call(roman)
    return process(roman) unless roman.start_with?('-')

    result = process(roman.sub('-', ''))
    result * -1
  end

  private

  def process(roman)
    result = 0
    roman.chars.each.with_index do |char, index|
      val = roman_numerals[char]
      next_val =  roman_numerals[roman[index + 1]]

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
    return ArabicToRoman.new(ROMAN_NUMERALS).call(number) if number.kind_of?(Numeric)
    RomanToArabic.new(ROMAN_NUMERALS).call(number)
  end
end
