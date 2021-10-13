class RomanNumeralsConverter
  class Input
    def call(number)
      return Roman.new(number) if number.is_a?(String)
      return Arabic.new(number) if number.is_a?(Integer)

      raise 'Invalid Input!'
    end

    class Roman < SimpleDelegator
      def positive?
        !start_with?('-')
      end

      def positive
        sub('-', '')
      end
    end

    class Arabic < SimpleDelegator; end
  end
end

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
    result = Array(number).map do |n|
      input = Input.new.call(n)

      next arabic_to_roman(input) if input.is_a?(Input::Arabic)

      roman_to_arabic(input)
    end

    return result.first if result.count == 1

    result
  end

  private

  def arabic_to_roman(arabic)
    return '' if arabic.zero?
    return convert_positive_arabic_to_roman(arabic) if arabic.positive?

    convert_negative_arabic_to_roman(arabic)
  end

  def convert_negative_arabic_to_roman(arabic)
    result = convert_positive_arabic_to_roman(arabic.abs)

    "-#{result}"
  end

  def convert_positive_arabic_to_roman(arabic)
    result = ''
    remainder = arabic

    while remainder.positive?
      roman_value = ROMAN_NUMERALS.find { |r_v| r_v[1] <= remainder }
      roman = roman_value[0]
      value = roman_value[1]

      remainder -= value
      result << roman
    end

    result
  end

  def roman_to_arabic(roman)
    return convert_positive_roman_to_arabic(roman) if roman.positive?

    convert_negative_roman_to_arabic(roman)
  end

  def convert_negative_roman_to_arabic(roman)
    result = convert_positive_roman_to_arabic(roman.positive)

    -result
  end

  def convert_positive_roman_to_arabic(roman)
    roman.chars.each.with_index.reduce(0) do |total, char_index|
      char = char_index[0]
      index = char_index[1]
      next_char = roman[index + 1]

      value = ROMAN_NUMERALS[char]
      next_value = ROMAN_NUMERALS[next_char]

      if next_value && next_value > value
        total -= value
      else
        total += value
      end

      total
    end
  end
end
