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
    return arabic_to_roman(number) if number.is_a?(Integer)
    roman_to_arabic(number)
  end

  private

  def arabic_to_roman(number)
    return convert_arabic_to_roman(number) if number > 0
    return "-#{convert_arabic_to_roman(-number)}" if number < 0
    ''
  end

  def roman_to_arabic(number)
    if number =~ /-/
      number = number.sub('-','')
      -convert_roman_to_arabic(number)
    else
      convert_roman_to_arabic(number)
    end

  end

  def convert_roman_to_arabic(number)
    result = 0
    number.chars.each.with_index do |char, index|
      next_char      = number[index+1]
      current_number = char_to_number(char)
      next_number    = char_to_number(next_char)

      if next_number > current_number
        result -= current_number
      else
        result += current_number
      end

    end
    result
  end

  def char_to_number(char)
    ROMAN_NUMERALS[char] || 0
  end

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
