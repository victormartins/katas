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

  attr_reader(
    :arabic_to_roman,
    :roman_to_arabic
  )

  def convert_number(number)
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

    def call(number)
      return convert_positive_number(number) unless number.start_with?('-')

      -convert_positive_number(number.sub('-', ''))
    end

    private

    def convert_positive_number(roman)
      roman.chars.each.with_index.reduce(0) do |result, char_index|
        char = char_index.first
        index = char_index.last
        value = @roman_numerals[char]
        next_value= @roman_numerals[roman[index + 1]]

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
      return convert_positive_number(arabic) unless arabic.negative?

      "-#{convert_positive_number(-arabic)}"
    end

    private

    def convert_positive_number(arabic)
      result = ''
      remainder = arabic

      while remainder.positive?
        roman_arabic = @roman_numerals.find { |_k, v| v <= remainder  }
        roman = roman_arabic.first
        arabic = roman_arabic.last

        result += roman
        remainder -= arabic
      end

      result
    end
  end
end
