## Dependencies
Install QCacheGrind
`brew install QCacheGrind`

To run: `$ qcachegrind` <br>
In QCacheGrind select all `callgrind*` files to open them.

## Questions?
- How to run two sets of RomanNumeralsCoverters concurrenlty?
  When using Threads I was expecting to see 4 seconds, but I get 8 seconds (4 + 4) anyway.

  **Single Run**
  ```
    End Optimized 1554291031
    Elapsed Optimized 4.091031
  ```
 **Using Threads Run**
  ```
    $ ./scripts/run.sh
    Start Original 1554290972
    Start Optimized 1554290972
    End Optimized 1554290980
    Elapsed Optimized 8.123775
    End Original 1554290980
    Elapsed Original 8.235773
  ```

  Example:
  ```
    result = RubyProf.profile do
      original = Thread.new do
        start = Time.now
        puts "Start Original #{start.to_i}"
        converter = Original::RomanNumeralsConverter.new
        100000.times do
          converter.convert(roman)
        end
        100000.times do
          converter.convert(arabic)
        end
        puts "End Original #{Time.now.to_i}"
        puts "Elapsed Original #{Time.now - start}"
      end

      optimized = Thread.new do
        start = Time.now
        puts "Start Optimized #{start.to_i}"
        converter = Optimized::RomanNumeralsConverter.new
        100000.times do
          converter.convert(roman)
        end
        100000.times do
          converter.convert(arabic)
        end
        puts "End Optimized #{Time.now.to_i}"
        puts "Elapsed Optimized #{Time.now - start}"
      end

      original.join
      optimized.join
    end
  ```