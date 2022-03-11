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

  def initialize
    @roman_to_arabic = RomanToArabic.new(ROMAN_NUMERALS)
    @arabic_to_roman = ArabicToRoman.new(ROMAN_NUMERALS)
  end

  def convert(number)
    return number.map { |n| execute_conversion(n) } if number.is_a?(Array)

    execute_conversion(number)
  end

  private

  attr_reader :roman_to_arabic, :arabic_to_roman

  def execute_conversion(number)
    raise("Invalid Input! #{number}") unless number.instance_of?(String) || number.is_a?(Numeric)

    return roman_to_arabic.call(number) if number.is_a?(String)

    arabic_to_roman.call(number)
  end
end

class ArabicToRoman
  def initialize(roman_numerals)
    @roman_numerals = roman_numerals
  end

  def call(arabic)
    return handle_positive_numbers(arabic) unless arabic.negative?

    "-#{handle_positive_numbers(-arabic)}"
  end

  private

  def handle_positive_numbers(arabic)
    remainder = arabic
    result = ''

    while(remainder.positive?)
      roman_arabic =@roman_numerals.find { |_ro, ar| ar <= remainder }
      roman = roman_arabic.first
      value = roman_arabic.last

      result << roman
      remainder -= value
    end

    result
  end
end

class RomanToArabic
  def initialize(roman_numerals)
    @roman_numerals = roman_numerals
  end

  def call(roman)
    return handle_positive_numbers(roman) unless roman.start_with?('-')

    -handle_positive_numbers(roman.sub('-', ''))
  end

  private

  def handle_positive_numbers(roman)
    result = 0

    roman.chars.each.with_index do |char, index|
      value = @roman_numerals[char]
      next_value = @roman_numerals[roman[index + 1]]

      # IV then -I + V because V > I
      # VI then V + I because  I < V
      if(next_value && next_value > value)
        result -= value
      else
        result += value
      end
    end

    result
  end
end
