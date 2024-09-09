# frozen_string_literal: true

module RomanNumeralsData
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
  def convert(number)
    if number.is_a?(Array)
      number.map { |e| execute(e) }
    else
      execute(number)
    end
  end

  def execute(number)
    raise 'Invalid Input!' unless number.is_a?(Integer) || number.is_a?(String)

    return RomanToArabic.new.call(number) if number.is_a?(String)

    ArabicToRoman.new.call(number)
  end
end

class RomanToArabic
  include RomanNumeralsData

  def call(roman)
    return convert(roman[1...]) * -1 if roman.start_with?('-')

    convert(roman)
  end

  private

  def convert(roman)
    roman.chars.each.with_index.reduce(0) do |result, char_index|
      char, index = char_index
      arabic = ROMAN_NUMERALS[char]
      next_char = roman[index + 1]
      next_arabic = ROMAN_NUMERALS[next_char] if next_char

      if next_arabic && next_arabic > arabic
        result - arabic
      else
        result + arabic
      end
    end
  end
end

class ArabicToRoman
  include RomanNumeralsData

  def call(input_arabic)
    return '' if input_arabic == 0

    if input_arabic.positive?
      convert(input_arabic)
    else
      '-' + convert(-input_arabic)
    end
  end

  private

  def convert(input_arabic)
    remainder = input_arabic
    result = ''

    while remainder.positive?
      roman, arabic = ROMAN_NUMERALS.find do |_k, v|
        v <= remainder
      end

      remainder -= arabic
      result += roman
    end

    result
  end
end
