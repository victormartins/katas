require 'contracts'

class ArabicToRoman
  def initialize(roman_numerals)
    @roman_numerals = roman_numerals
  end

  def call(number)
    if(number >= 0)
      execute(number)
    else
      result = execute(number * -1)
      "-#{result}"
    end
  end

  private

  def execute(number)
    remainder = number
    result = ''

    while(remainder > 0)
      data = find_lowest_roman_numeral_for(remainder)
      roman = data[0]
      value = data[1]

      result << roman
      remainder -= value
    end
    result
  end

  def find_lowest_roman_numeral_for(number)
    @roman_numerals.detect { |_k, v| v <=number}
  end
end

class RomanToArabic
  def initialize(roman_numerals)
    @roman_numerals = roman_numerals
  end

  def call(roman_number)
    if(roman_number.start_with?('-'))
      roman_number = roman_number.sub('-', '')
      result = execute(roman_number)
      result * -1
    else
      execute(roman_number)
    end
  end

  def execute(roman_number)
    result = 0
    roman_number.chars.each.with_index do |char, index|
      char_val = @roman_numerals[char]
      next_char_val = @roman_numerals[roman_number[index + 1]]

      if(next_char_val && next_char_val > char_val)
        char_val *= -1
      end

      result += char_val
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
