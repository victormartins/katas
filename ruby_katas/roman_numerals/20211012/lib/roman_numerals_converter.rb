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
    return arabic_to_roman(number) if (number.is_a?(Numeric))

    roman_to_arabic(number)
  end

  private

  def arabic_to_roman(number)
    return convert_arabic_to_roman(number) unless number.negative?

    number *= -1
    result = convert_arabic_to_roman(number)

    "-#{result}"
  end

  def convert_arabic_to_roman(number)
    result = ''
    remainder = number

    while remainder.positive?
      roman_value = ROMAN_NUMERALS.find { |r_v| r_v[1] <= remainder }
      roman = roman_value[0]
      value = roman_value[1]

      remainder -= value
      result << roman
    end

    result
  end

  def roman_to_arabic(number)
    return convert_roman_to_arabic(number) unless number.start_with?('-')

    number.sub!('-', '')
    result = convert_roman_to_arabic(number)
    -result
  end

  def convert_roman_to_arabic(number)
    number.chars.each.with_index.reduce(0) do |total, char_index|
      char = char_index[0]
      index = char_index[1]
      next_char = number[index + 1]

      value = ROMAN_NUMERALS[char]
      next_value = ROMAN_NUMERALS[next_char]

      if(next_value && next_value > value)
        total -= value
      else
        total += value
      end
    end
  end
end
