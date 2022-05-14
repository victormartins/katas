# frozen_string_literal: true

require 'pry'

class RomanNumeralsConverter
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

  def initialize
    @roman_to_arabic = RomanToArabic.new(ROMAN_NUMERALS)
    @arabic_to_roman = ArabicToRoman.new(ROMAN_NUMERALS)
  end

  def convert(number)
    return number.map { |n| convert_value(n) } if number.is_a?(Array)

    convert_value(number)
  end

  private

  attr_reader :roman_to_arabic, :arabic_to_roman

  def convert_value(number)
    raise("Invalid Input! #{number}") unless number.is_a?(String) || number.is_a?(Integer)

    return roman_to_arabic.call(number) if number.is_a?(String)

    arabic_to_roman.call(number)
  end
end

class RomanNumeralsConverter
  class RomanToArabic
    def initialize(roman_numerals)
      @roman_numerals = roman_numerals
    end

    def call(roman)
      return convert_positive(roman) unless roman.start_with?('-')

      -convert_positive(roman.sub('-', ''))
    end

    private

    def convert_positive(roman)
      roman.chars.each.with_index.reduce(0) do |result, index_char|
        char, index = index_char
        value = @roman_numerals[char]
        next_value = @roman_numerals[roman[index + 1]]

        if(next_value && next_value > value)
          result -= value
        else
          result += value
        end

        result
      end
    end
  end
end

class RomanNumeralsConverter
  class ArabicToRoman
    def initialize(roman_numerals)
      @roman_numerals = roman_numerals
    end

    def call(arabic)
      return convert_positive(arabic) unless arabic.negative?

      "-#{convert_positive(-arabic)}"
    end

    private

    def convert_positive(arabic)
      result = ''

      while(arabic.positive?)
        roman, value = @roman_numerals.find do |_roman, value|
          value <= arabic
        end

        result += roman
        arabic -= value
      end

      result
    end
  end
end
