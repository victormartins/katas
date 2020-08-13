class Sorter
  module Strategies
    # On each iteration, find the minimal value and change its position
    # on the whith left most end value that is not  sorted
    #
    # Iteration 1.1 - Find the min value in the array
    # [6, 5, 1, 3, 4]
    #        ^
    # Iteration 1.2 - Swap with first unsorted value on the left
    # [1, 5, 6, 3, 4]
    #  ^     ^
    #
    # Iteration 2.1 - Find the next min value in the array
    # [1, 5, 6, 3, 4]
    #           ^
    # Iteration 2.2 - Swap with first unsorted value on the left
    # [1, 3, 6, 5, 4]
    #     ^     ^
    # (...)
    #
    # Continue until there is no more values to swap
    class SelectionSort < Base
      def tick


        @tail_index ||= 0

        return @completed = true if @tail_index == @result.length

        unsorted_data = @result.slice(@tail_index..-1)

        # Find the index of the min value in the remaining unsorted data
        unsorted_min_index = find_min_value_index(unsorted_data)
        swap_index = @tail_index + unsorted_min_index

        logger.debug { "[#{self.class}] - tail_index         = #{@tail_index}" }
        logger.debug { "[#{self.class}] - unsorted_min_index = #{unsorted_min_index}" }
        logger.debug { "[#{self.class}] - swap_index         = #{swap_index}" }
        logger.debug { "[#{self.class}] - unsorted_data      = #{unsorted_data}" }
        logger.debug { "[#{self.class}] - result             = #{@result}" }

        unsorted_min_value = @result[swap_index]

        @result[swap_index] = @result[@tail_index]
        @result[@tail_index] = unsorted_min_value

        @tail_index += 1

        logger.debug { 'Tick Ended' }
      end

      private

      def find_min_value_index(arr)
        min = nil
        min_index = nil

        arr.each.with_index do |value, i|
          min ||= value
          min_index ||= i

          if value < min
            min = value
            min_index = i
          end
        end

        min_index
      end
    end
  end
end
