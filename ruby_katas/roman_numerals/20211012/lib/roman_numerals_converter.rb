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
    if(number.negative?)
      negative = true
      number *= -1
    end

    result = ''
    remainder = number

    while remainder.positive?
      roman_value = ROMAN_NUMERALS.find { |r_v| r_v[1] <= remainder }
      roman = roman_value[0]
      value = roman_value[1]

      puts "roman #{roman}, value #{value}"

      remainder -= value
      result << roman
    end

    if(negative)
      "-#{result}"
    else
      result
    end
  end

  def roman_to_arabic(number)
    if(number.start_with?('-'))
      number.sub!('-', '')
      negative = true
    end

    number.chars.each.with_index.reduce(0) do |total, char_index|
      char = char_index[0]
      index = char_index[1]
      next_char = number[index + 1]

      value = ROMAN_NUMERALS[char]
      next_value = ROMAN_NUMERALS[next_char]

      puts "value: #{value}, next_char #{next_char}, next_value #{next_value}"

      if(next_value && next_value > value)
        total -= value
      else
        total += value
      end

      if(negative)
        -total
      else
        total
      end
    end
  end
end
