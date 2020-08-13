require 'logger'
require_relative 'strategies'

class Sorter
  LOG_LEVEL = :info

  def initialize(input, strategy: Sorter::Strategies::BubbleSort)
    @logger   = Logger.new(STDOUT, level: LOG_LEVEL)
    @strategy = strategy.new(input, logger: @logger)
    @strategy_name = @strategy.class.name.split('::').last
    @result   = []
    @number_of_interations = 0
    @number_of_elements_to_sort = input.length
  end

  def tick
    @number_of_interations += 1
    @strategy.tick
    logger.info { "[#{self.class}] (#{@strategy_name}) Iteration Complete: #{@number_of_interations}" }
    logger.debug { "[#{self.class}] Iteration Result: #{@strategy.result}" }
  end

  def completed?
    completed = @strategy.completed?

    if completed
      logger.info do
        "[#{self.class}] Sorted #{@number_of_elements_to_sort} numbers in #{@number_of_interations} iterations."
      end
    end

    completed
  end

  def result
    @strategy.result
  end

  def sort
    until @strategy.completed? do @strategy.tick end
    @strategy.result
  end

  private

  attr_reader :logger
end
