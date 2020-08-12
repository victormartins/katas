require 'benchmark/ips'
require_relative 'lib/sorter'

NUMBER_OF_ELEMENTS_TO_SORT = 50000
MAX_DIGIT = 16

input = []
NUMBER_OF_ELEMENTS_TO_SORT.times do
  input << Random.new.rand((1..MAX_DIGIT))
end

puts "Generated #{NUMBER_OF_ELEMENTS_TO_SORT} digits to sort."

puts 'Loading sorters...'
ruby_sorter   = Sorter.new(input, strategy: Sorter::Strategies::RubySort)
bubble_sorter = Sorter.new(input, strategy: Sorter::Strategies::BubbleSort)

puts 'Starting Benchmark...'
Benchmark.ips do |x|
  x.warmup = 2

  x.report('Ruby Sort')   { ruby_sorter.sort }
  x.report('Bubble Sort') { bubble_sorter.sort }

  x.compare!
end
