# frozen_string_literal: true

class RomanNumeralsConverter
  require 'roman_to_arabic'
  require 'arabic_to_roman'

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

  def convert(input)
    return convert_single(input) unless input.is_a?(Array)

    input.map { |i| convert_single(i) }
  end

  private

  def convert_single(input)
    assert_input!(input)

    return RomanToArabic.call(input) if input.is_a?(String)

    ArabicToRoman.call(input)
  end

  def assert_input!(input)
    return true if input.is_a?(Integer)
    return true if input.is_a?(String)

    raise "Invalid Input! #{input}"
  end
end
