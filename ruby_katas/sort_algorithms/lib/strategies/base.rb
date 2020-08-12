class Sorter
  module Strategies
    class Base
      attr_reader :result

      def initialize(input, logger: Logger.new(STDOUT))
        @result    = input.dup
        @completed = false
        @logger = logger
      end

      def completed?
        @completed
      end

      def tick
        raise NotImplementedError
      end

      private

      attr_reader :logger
    end
  end
end
