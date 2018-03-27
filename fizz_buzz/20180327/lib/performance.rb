require './fizz_buzz'
require './optimized_fizz_buzz'

require 'benchmark/ips'
require 'memory_profiler'

input = (1..100_000).to_a

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
# FizzBuzz               5.331  (± 0.0%) i/s -     27.000  in   5.072574s
# OptimizedFizzBuzz      5.585  (± 0.0%) i/s -     28.000  in   5.020006s#
#
# GC.disable
# WITH GC OFF
# FizzBuzz               4.673  (±42.8%) i/s -     18.000  in   5.247332s
# OptimizedFizzBuzz      4.655  (±43.0%) i/s -     16.000  in   5.495758s

Benchmark.ips do |x|
  x.report('FizzBuzz') do
    fizz_buzz = FizzBuzz.new
    fizz_buzz.call(input)
  end

  x.report('OptimizedFizzBuzz') do
    fizz_buzz = OptimizedFizzBuzz.new
    fizz_buzz.call(input)
  end
end

memory_profiler('FizzBuzz') do
  fizz_buzz = FizzBuzz.new
  fizz_buzz.call(input)
end
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
end
# Total allocated: 36800320 bytes (900006 objects)
# Total retained:  160 bytes (2 objects)

# allocated memory by class
# -----------------------------------
#   36800040  Array
#        160  Proc
#         40  FizzBuzzRules
#         40  Hash
#         40  OptimizedFizzBuzz
# allocated objects by class
# -----------------------------------
#     900001  Array
#          2  Proc
#          1  FizzBuzzRules
#          1  Hash
#          1  OptimizedFizzBuzz
