require 'contracts'

class ArabicToRoman
  def initialize(roman_numerals)
    @roman_numerals = roman_numerals
  end

  def call(number)
    return execute(number) if number >= 0

    result = execute(number * -1)
    "-#{result}"
  end

  private

  def execute(number)
    remainer = number
    result = ''

    while remainer > 0
      roman_arabic_pair = @roman_numerals.detect { |_k, value|  value <= remainer  }
      roman = roman_arabic_pair[0]
      value = roman_arabic_pair[1]
      result << roman
      remainer -= value
    end

    result

  end
end

class RomanToArabic
  def initialize(roman_numerals)
    @roman_numerals = roman_numerals
  end

  def call(roman_number)
    return execute(roman_number) unless roman_number.start_with?('-')
    result = execute(roman_number.sub('-', ''))
    result * -1
  end

  private

  def execute(roman_number)
    result = 0
    roman_number.chars.each.with_index do |char, index|
      value = @roman_numerals[char]
      next_value = @roman_numerals[roman_number[index + 1]]

      if(next_value && next_value > value)
        result -= value
      else
        result += value
      end
    end
    result
  end
end

class RomanNumeralsConverter
  include Contracts::Core
  include Contracts::Builtin

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
    return ArabicToRoman.new(ROMAN_NUMERALS).call(number) if number.kind_of?(Numeric)
    RomanToArabic.new(ROMAN_NUMERALS).call(number)
  end
end
