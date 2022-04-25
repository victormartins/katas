# frozen_string_literal: true

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
  }.freeze

  def initialize
    @convert_roman_to_arabic = RomanToArabic.new(ROMAN_NUMERALS)
    @convert_arabic_to_roman = ArabicToRoman.new(ROMAN_NUMERALS)
  end

  def convert(input)
    return input.map { |number| convert_number(number) } if input.is_a?(Array)

    convert_number(input)
  end

  private

  def convert_number(number)
    with_title(number) do
      raise('Invalid Input!') unless number.kind_of?(Integer) || number.kind_of?(String)

      return convert_roman_to_arabic.call(number) if number.kind_of?(String)

      convert_arabic_to_roman.call(number)
    end
  end

  private

  attr_reader :convert_roman_to_arabic, :convert_arabic_to_roman

  def with_title(number)
    puts
    puts
    puts "=" * 50
    puts "Converting: #{number}"
    result = yield
    puts
    puts "Conversion Result: #{result}"
    puts "=" * 50
    result
  end
end

class RomanNumeralsConverter
  class RomanToArabic
    def initialize(roman_numerals)
      @roman_numerals = roman_numerals
    end

    def call(roman)
      return convert_positive(roman) unless roman.start_with?('-')

      -convert_positive(roman.sub('-', ''))
    end

    private

    def convert_positive(roman)
      roman.chars.each.with_index.reduce(0) do |result, char_index|
        char, index = char_index
        next_char = roman[index + 1]

        value = @roman_numerals[char]

        # If next_char is nil there is no problem because Hash will return nil
        # if we pass a nil key.
        next_value = @roman_numerals[next_char]

        if(next_value && next_value > value)
          result -= value
        else
          result += value
        end

        result
      end
    end
  end
end

class RomanNumeralsConverter
  class ArabicToRoman
    def initialize(roman_numerals)
      @roman_numerals = roman_numerals
    end

    def call(arabic)
      return convert_positive(arabic) unless arabic.negative?

      "-#{convert_positive(-arabic)}"
    end

    private

    def convert_positive(arabic)
      result = ''
      remainder = arabic

      # We are reducing a quantity of something (arabic number) into buckets of a given range.
      # A bucket is the range between the a given roman numeral and the next.
      #
      # Until we are in that bucket range we take leters from there and subtract
      # the remainder value until we covered all ranges
      # To know if we are in the range, we can check if the remainder value is lower
      # or equal to a given top level of the range
      # Eg:
      # ==================================================
      # Converting: 23

      # Result: ""
      # Remainder: 23
      # Roman: X
      # Value: 10


      # Result: "X"
      # Remainder: 13
      # Roman: X
      # Value: 10


      # Result: "XX"
      # Remainder: 3
      # Roman: I
      # Value: 1


      # Result: "XXI"
      # Remainder: 2
      # Roman: I
      # Value: 1


      # Result: "XXII"
      # Remainder: 1
      # Roman: I
      # Value: 1
      # ----------

      # Conversion Result: XXIII
      # ==================================================

      while(remainder.positive?)
        roman, value = @roman_numerals.find { |_roman, value| value <= remainder }

        puts
        puts "Result: #{result.inspect}"
        puts "Remainder: #{remainder}"
        puts "Roman: #{roman}"
        puts "Value: #{value}"
        puts '-' * 10

        remainder -= value
        result += roman
      end

      result
    end
  end
end
