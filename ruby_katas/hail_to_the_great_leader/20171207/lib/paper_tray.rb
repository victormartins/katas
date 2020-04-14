class PaperTray
  require 'singleton'
  include Singleton

  attr_reader :queue

  def initialize
    @queue = Queue.new
  end
end
