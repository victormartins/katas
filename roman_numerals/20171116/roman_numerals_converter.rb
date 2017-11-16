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

  def arabic_to_roman(number)
    return convert_arabic_to_roman(number) if number >= 0
    "-#{convert_arabic_to_roman(-number)}"
  end

  def roman_to_arabic(number)
    return -convert_roman_to_arabic(number.sub('-','')) if number =~ /^-/
    convert_roman_to_arabic(number)
  end

  def convert_arabic_to_roman(number)
    result = ''
    ROMAN_NUMERALS.each_pair do |roman, arabic|
      while number >= arabic
        result << roman
        number -= arabic
      end
    end
    result
  end

  def convert_roman_to_arabic(number)
    result = 0
    number.chars.each.with_index do |char, i|
      result += calculate_arabic(char, number[i+1])
    end
    result
  end

  def calculate_arabic(char, next_char)
    current_n = char_to_number(char)
    next_n    = char_to_number(next_char)

    return -current_n if next_n > current_n #IV
    current_n  #VI or V
  end

  def char_to_number(char)
    ROMAN_NUMERALS[char] || 0
  end
end
