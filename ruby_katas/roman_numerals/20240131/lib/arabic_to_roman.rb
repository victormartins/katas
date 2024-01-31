# frozen_string_literal: true

class ArabicToRoman
  def self.call(arabic)
    new(arabic).call
  end

  def initialize(arabic)
    @negative = arabic.negative?
    @arabic = arabic.abs
  end

  def call
    return convert_positive unless @negative

    "-#{convert_positive}"
  end

  private

  def convert_positive
    remainder = @arabic
    result = ''

    while remainder.positive?
      roman, arabic = RomanNumeralsConverter::ROMAN_NUMERALS.find { |_roman, arabic| arabic <= remainder }

      remainder -= arabic
      result += roman
    end

    result
  end
end
