require 'benchmark/ips'
require_relative 'lib/sorter'

NUMBER_OF_ELEMENTS_TO_SORT = 25000
MAX_DIGIT = 16
STRATEGIES_TO_BENCHMARK = [
  Sorter::Strategies::RubySort,
  Sorter::Strategies::BubbleSort,
  Sorter::Strategies::SelectionSort
]


# Generate Input
input = []
NUMBER_OF_ELEMENTS_TO_SORT.times do
  input << Random.new.rand((1..MAX_DIGIT))
end
puts ''
puts "Generated #{NUMBER_OF_ELEMENTS_TO_SORT} digits to sort."
puts ''

# Benchmarking
Benchmark.ips do |x|
  x.warmup = 2

  STRATEGIES_TO_BENCHMARK.each do |sort_strategy|
    puts "Loaded: #{sort_strategy}"

    sorter = Sorter.new(input, strategy: sort_strategy)
    strategy_name = sort_strategy.to_s.split('::').last
    x.report(strategy_name) { sorter.sort }
  end

  puts ''
  puts 'Starting Benchmark...'
  x.compare!
end
