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

  def roman_to_arabic(number)
    if number =~ /^-/
      - convert_roman_to_arabic(number.sub('-', ''))
    else
      convert_roman_to_arabic(number)
    end
  end


  def arabic_to_roman(number)
    return convert_arabic_to_roman(number) if number >= 0
    "-#{convert_arabic_to_roman(-number)}"
  end

  def convert_roman_to_arabic(number)
    result = 0
    number.each_char.with_index do |chr, i|
      current_value = roman_char_to_number(chr)
      next_value = roman_char_to_number(number[i+1])

      if next_value > current_value
        result -= current_value
      else
        result += current_value
      end
    end
    result
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

  def roman_char_to_number(chr)
    ROMAN_NUMERALS[chr] || 0
  end
end
