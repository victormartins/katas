require './fizz_buzz'
require './optimized_fizz_buzz'

require 'benchmark/ips'
require 'memory_profiler'

input       = (1..100_000).to_a
test_memory = true
test_ips    = true

def memory_profiler(title=nil)
  begin
    puts ''
    puts '-' * 50
    puts "#{title}".center(50)
    puts '-' * 50
    puts ''
  end if title
  report = MemoryProfiler.report do
    yield
  end

  # report.pretty_print(to_file: "memory_profiler_#{timestamp}.txt")
  report.pretty_print
end


# WITH GC ON
# FizzBuzz               5.211  (± 0.0%) i/s -     26.000  in   5.002537s
# OptimizedFizzBuzz      7.366  (± 0.0%) i/s -     37.000  in   5.026056s
#
# Comparison:
# OptimizedFizzBuzz:        7.4 i/s
# FizzBuzz:                 5.2 i/s - 1.41x  slower
#
# GC.disable
# WITH GC OFF

Benchmark.ips do |x|
  x.report('FizzBuzz') do
    fizz_buzz = FizzBuzz.new
    fizz_buzz.call(input)
  end

  x.report('OptimizedFizzBuzz') do
    fizz_buzz = OptimizedFizzBuzz.new
    fizz_buzz.call(input)
  end

  x.compare!
end if test_ips

memory_profiler('FizzBuzz') do
  fizz_buzz = FizzBuzz.new
  fizz_buzz.call(input)
end if test_memory
# Total allocated: 36267040 bytes (886674 objects)
# Total retained:  160 bytes (2 objects)
#
# allocated memory by class
# -----------------------------------
#   32000160  Array
#    4000000  FizzBuzzRules
#     266640  String
#        160  Proc
#         40  FizzBuzz
#         40  Hash
#
# allocated objects by class
# -----------------------------------
#     780004  Array
#     100000  FizzBuzzRules
#       6666  String
#          2  Proc
#          1  FizzBuzz
#          1  Hash



memory_profiler('OptimizedFizzBuzz') do
  fizz_buzz = OptimizedFizzBuzz.new
  fizz_buzz.call(input)
end if test_memory
# Total allocated: 32000400 bytes (780008 objects)
# Total retained:  160 bytes (2 objects)
#
# allocated memory by class
# -----------------------------------
#   32000160  Array
#        160  Proc
#         40  Hash
#         40  OptimizedFizzBuzz
#
# allocated objects by class
# -----------------------------------
#     780004  Array
#          2  Proc
#          1  Hash
#          1  OptimizedFizzBuzz
