module Original
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
end

module Optimized
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
    def initialize
      @arabic_to_roman = ArabicToRoman.new
      @roman_to_arabic = RomanToArabic.new
    end

    def convert(number)
      return @arabic_to_roman.call(number) if number.kind_of?(Numeric)
      @roman_to_arabic.call(number)
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
end


require 'ruby-prof'

ruby_prof_opts = {
  # https://github.com/ruby-prof/ruby-prof#measurements
  measure_mode: RubyProf::WALL_TIME
}

GC.disable
roman = "XVIIXXIXXIII"
arabic = 765
original_converter = Original::RomanNumeralsConverter.new
optimized_converter = Optimized::RomanNumeralsConverter.new
ENV['PROFILE'] ||= 'true'
ENV['BENCHMARK'] ||= 'true'


if(ENV['PROFILE'] == 'true')
  result = RubyProf.profile do
      start = Time.now
      puts "Start Optimized #{start.to_i}"
      100000.times do
        optimized_converter.convert(roman)
      end
      100000.times do
        optimized_converter.convert(arabic)
      end
      puts "End Optimized #{Time.now.to_i}"
      puts "Elapsed Optimized #{Time.now - start}"
  end

  min_percent = 1
  timestamp = Time.now.to_i

  printer = RubyProf::FlatPrinter.new(result)
  printer.print(File.open("results/#{timestamp}_roman_flat_profile.txt", 'w+'), min_percent: min_percent)

  printer = RubyProf::GraphHtmlPrinter.new(result)
  printer.print(File.open("results/#{timestamp}_roman_graph_profile.html", 'w+'), min_percent: min_percent)

  printer = RubyProf::CallStackPrinter.new(result)
  printer.print(File.open("results/#{timestamp}_roman_call_stack_profile.html", 'w+'))

  printer = RubyProf::CallTreePrinter.new(result)
  printer.print(:path => "./results", :profile => "callgrind")
end

if ENV['BENCHMARK'] == 'true'
  puts ''
  puts '-' * 50
  puts 'BENCHMARKING'.center(50)
  require 'benchmark/ips'

  Benchmark.ips do |x|

    x.config(time: 1, warmup: 2)

    x.report("Original Implementation") do
      original_converter.convert(roman)
    end

    x.report("Optimized Implementation") do
      optimized_converter.convert(roman)
    end

    x.compare!
  end

  puts '-' * 50
  puts ''
end