require 'contracts'

module RomanNumerals
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
end

class RomanNumeralsConverter
  include Contracts::Core
  include Contracts::Builtin

  def convert(number)
    return ArabicToRoman.new.call(number) if number.kind_of?(Numeric)
    RomanToArabic.new.call(number)
  end
end

class ArabicToRoman
  include RomanNumerals

  def call(number)
    return execute(number) if number >= 0
    "-#{execute(-number)}"
  end

  private

  def execute(number)
    result = ''
    remainder = number

    while(remainder > 0) do
      roman_val = ROMAN_NUMERALS.detect do |r_v|
        v = r_v[1]
        v <= remainder
      end

      roman = roman_val[0]
      value = roman_val[1]

      remainder -= value
      result += roman
    end

    result
  end
end

class RomanToArabic
  include RomanNumerals

  def call(roman)
    return execute(roman) unless roman.start_with?('-')
    -execute(roman.sub('-', ''))
  end

  private

  def execute(roman)
    roman.chars.each.with_index.inject(0) do |result, char_index|
      char = char_index[0]
      index = char_index[1]
      value = ROMAN_NUMERALS[char]
      next_value = ROMAN_NUMERALS[roman[index + 1]]

      if(next_value && next_value > value)
        result -= value
      else
        result += value
      end
    end
  end
end


require 'ruby-prof'

GC.disable
roman = "XVIIXXIXXIII"
result = RubyProf.profile do
  result = RomanNumeralsConverter.new.convert(roman)
  puts result
end

min_percent = 1

printer = RubyProf::FlatPrinter.new(result)
printer.print(File.open('results/roman_flat_profile.txt', 'w+'), min_percent: min_percent)

printer = RubyProf::GraphHtmlPrinter.new(result)
printer.print(File.open('results/roman_graph_profile.html', 'w+'), min_percent: min_percent)

printer = RubyProf::CallStackPrinter.new(result)
printer.print(File.open('results/roman_call_stack_profile.html', 'w+'))