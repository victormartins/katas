class Sorter
  module Strategies
    class RubySort < Base
      def tick
        @result.sort!
        @completed = true
      end
    end
  end
end
