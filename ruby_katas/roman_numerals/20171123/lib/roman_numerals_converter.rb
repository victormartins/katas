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
    return convert_arabic_to_roman(number) if number >= 0
    "-#{convert_arabic_to_roman(-number)}"
  end

  def convert_arabic_to_roman(number)
    result = ''
    ROMAN_NUMERALS.each_pair do |roman, arabic|
      while number >= arabic do
        # break if too many iterations
        number -= arabic
        result << roman
      end
    end
    result
  end

  def roman_to_arabic(number)
    return -convert_roman_to_arabic(number.sub('-', '')) if number =~ /^-/
    convert_roman_to_arabic(number)
  end

  def convert_roman_to_arabic(number)
    result = 0
    number.chars.each.with_index do |char, index|
      current_n = char_to_number(char)
      next_n = char_to_number(number[index + 1])

      if next_n > current_n
        result -= current_n
      else
        result += current_n
      end
    end
    result
  end

  def char_to_number(char)
    ROMAN_NUMERALS[char] || 0
  end
end
