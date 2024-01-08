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

  def convert(number)
    if number.is_a?(Array)
      number.map { convert_number(_1) }
    else
      convert_number(number)
    end
  end

  def convert_number(number)
    validate_input!(number)

    return RomanToArabic.call(number) if number.is_a?(String)

    ArabicToRoman.call(number)
  end

  private

  def validate_input!(number)
    return true if [String, Integer].include?(number.class)

    raise 'Invalid Input!'
  end

  class RomanToArabic
    def self.call(number)
      new(number).call
    end

    def initialize(roman)
      @roman = roman
    end

    def call
      return convert(@roman) unless @roman.start_with?('-')

      convert_negative_roman(@roman)
    end

    private

    def convert_negative_roman(input)
      normalized_input = input.sub('-', '')
      -convert(normalized_input)
    end

    def convert(input)
      input.chars.each.with_index.reduce(0) do |total, char_index|
        char, index = char_index
        value = ROMAN_NUMERALS[char]
        next_char = @roman[index + 1]
        next_value = ROMAN_NUMERALS[next_char]

        if next_value && next_value > value
          total -= value
        else
          total += value
        end

        total
      end
    end
  end

  class ArabicToRoman
    def self.call(arabic)
      new(arabic).call
    end

    def initialize(arabic)
      @arabic = arabic
    end

    def call
      return convert(@arabic) unless @arabic.negative?

      convert_negative_arabic
    end

    private

    def convert_negative_arabic
      positive_arabic = -@arabic

      "-#{convert(positive_arabic)}"
    end

    def convert(input)
      remainder = input
      result = ''

      while remainder.positive?
        roman, arabic = ROMAN_NUMERALS.find { |_k, v| v <= remainder }

        remainder -= arabic
        result += roman
      end

      result
    end
  end
end
