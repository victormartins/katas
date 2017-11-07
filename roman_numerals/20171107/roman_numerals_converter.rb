class RomanNumeralsConverter
  ROMAN_NUMERALS = {
    'I' => 1,
    'V' => 5
  }
  def convert(number)
    roman_numeral_for(number)
  end

  private

  def roman_numeral_for(number)
    ROMAN_NUMERALS.detect { |k, v| v == number}.first
  end
end
