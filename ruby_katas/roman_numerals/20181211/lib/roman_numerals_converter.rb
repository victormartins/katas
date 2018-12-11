require 'contracts'


# Converts roman numbers to arabic
class RomanNumeralsConverter
  # converts roman to arabic
  class RomanToArabic
    def initialize(roman_numerals)
      @roman_numerals = roman_numerals
    end

    def call(roman_number)
      @roman_number = roman_number
      convert_roman_to_arabic
    end

    private

    def convert_roman_to_arabic
      return roman_to_arabic unless @roman_number.start_with?('-')

      @roman_number.sub!('-', '')
      result = roman_to_arabic
      result * -1
    end

    def roman_to_arabic
      result = 0
      @roman_number.each_char.with_index do |roman_char, index|
        value = @roman_numerals[roman_char]
        next_value = @roman_numerals[@roman_number[index + 1]]

        if(next_value && next_value > value)
          value *= -1
        end

        result += value
      end
      result
    end
  end

  # Converts Arabic to Roman
  class ArabicToRoman
    def initialize(roman_numerals)
      @roman_numerals = roman_numerals
    end

    def call(number)
      @number = number
      convert_arabic_to_roman
    end

    private

    def convert_arabic_to_roman
      return arabic_to_roman if(@number >= 0)

      @number *= -1
      result = arabic_to_roman
      "-#{result}"
    end


    def arabic_to_roman
      result = ''
      remainder = @number

      while(remainder > 0)
        roman_char_value = find_lowest_roman_number_for(remainder)

        roman_char = roman_char_value[0]
        value = roman_char_value[1]

        result << roman_char
        remainder -= value
      end

      result
    end

    def find_lowest_roman_number_for(remainder)
      @roman_numerals.detect { |_roman_char, value| value <= remainder}
    end
  end

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
