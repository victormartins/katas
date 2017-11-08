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
  }

  def convert(number)
    return convert_arabic_to_roman(number) if number > 0
    return "-#{convert_arabic_to_roman(-number)}" if number < 0
    ''
  end

  private

  def convert_arabic_to_roman(number)
    ROMAN_NUMERALS.each_with_object('') do |roman_arabic, result|
      roman  = roman_arabic[0]
      arabic = roman_arabic[1]

      while number >= arabic
        result << roman
        number -= arabic
      end
    end
  end
end
