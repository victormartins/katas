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

  def convert(number)
    return number.map { |n| convert_input(n) } if number.is_a?(Array)

    convert_input(number)
  end

  def convert_input(number)
    raise("Invalid Input! #{number}") unless number.is_a?(Integer) || number.is_a?(String)

    return roman_to_arabic.call(number) if number.is_a?(String)

    arabic_to_roman.call(number)
  end

  private

  attr_reader :roman_to_arabic, :arabic_to_roman
end

class RomanNumeralsConverter
  class RomanToArabic
    def initialize(roman_numerals)
      @roman_numerals = roman_numerals
    end

    def call(roman)
      return convert_positive_roman(roman) unless roman.start_with?('-')

      -convert_positive_roman(roman.sub('-', ''))
    end

    private

    def convert_positive_roman(roman)
      roman.chars.each.with_index.reduce(0) do |result, char_index|
        char = char_index.first
        index = char_index.last

        value = @roman_numerals[char]
        next_char = roman[index + 1]
        next_value = @roman_numerals[next_char]

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
      return convert_positive_arabic(arabic) unless arabic.negative?

      "-#{convert_positive_arabic(-arabic)}"
    end

    private

    def convert_positive_arabic(arabic)
      result = ''
      remainder = arabic

      while remainder.positive?
        roman, value = @roman_numerals.find { |_roman, value| value <= remainder }
        result += roman
        remainder -= value
      end

      result
    end
  end
end
