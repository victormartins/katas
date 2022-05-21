# frozen_string_literal: true

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

  def convert(input)
    return input.map { |number| convert_number(number) } if input.is_a?(Array)

    convert_number(input)
  end

  private

  attr_reader :roman_to_arabic, :arabic_to_roman

  def convert_number(number)
    raise "Invalid Input! #{number}" unless number.is_a?(String) || number.is_a?(Integer)

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
      return conver_number(roman) unless roman.start_with?('-')

      -conver_number(roman.sub('-', ''))
    end

    private

    def conver_number(roman)
      roman.chars.each.with_index.reduce(0) do |result, char_index|
        char, index = char_index
        value = @roman_numerals[char]
        next_value = @roman_numerals[roman[index + 1]]

        if next_value && next_value > value
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
      return conver_number(arabic) unless arabic.negative?

      "-#{conver_number(-arabic)}"
    end

    private

    def conver_number(arabic)
      result = ''
      remainder = arabic

      while remainder.positive?
        roman, value = @roman_numerals.find { |_roman, value| value <= remainder }
        remainder -= value
        result += roman
      end

      result
    end
  end
end
