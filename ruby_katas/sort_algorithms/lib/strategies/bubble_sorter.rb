class Sorter
  module Strategies
    class BubbleSort < Base
      def tick
        # starting from the beginning of the array, compare each two
        # consecutive pairs of elements and order them until we reach
        # the end of the array

        no_changes = true
        b_index = 1

        while b_index < @result.length
          a_index = b_index - 1
          a = @result[a_index]
          b = @result[b_index]

          logger.debug { "[#{self.class}] A = #{a}; B = #{b}" }

          if a > b
            @result[a_index] = b
            @result[b_index] = a
            no_changes = false
          end

          b_index += 1
        end

        @completed = no_changes
      end
    end
  end
end
