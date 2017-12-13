require 'contracts'

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

  Contract(Or[String, Num] => Or[String, Num])
  def convert(number)
    return arabic_to_roman(number) if number.is_a?(Integer)
    roman_to_arabic(number)
  end

  private

  Contract(Num => String)
  def arabic_to_roman(number)
    return convert_arabic_to_roman(number) if number >= 0
    "-#{convert_arabic_to_roman(-number)}"
  end

  Contract(Num => String)
  def convert_arabic_to_roman(number)
    ROMAN_NUMERALS.each_pair.with_object('') do |roman_arabic, result|
      roman  = roman_arabic[0]
      arabic = roman_arabic[1]

      while number >= arabic
        result << roman
        number -= arabic
      end
    end
  end

  Contract(String => Num)
  def roman_to_arabic(number)
    return -convert_roman_to_arabic(number.sub('-', '')) if number =~ /^-/
    convert_roman_to_arabic(number)
  end

  Contract(String => Num)
  def convert_roman_to_arabic(number)
    number.chars.each.with_index.inject(0) do |result, char_index|
      char = char_index[0]
      index = char_index[1]
      current_n = char_to_number(char)
      next_n = char_to_number(number[index + 1])

      if next_n > current_n
        result -= current_n
      else
        result += current_n
      end
    end
  end

  Contract(Maybe[String] => Num)
  def char_to_number(input)
    ROMAN_NUMERALS[input] || 0
  end
end
