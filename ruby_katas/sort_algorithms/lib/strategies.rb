class Sorter
  require_relative 'strategies/base'
  Dir["#{__dir__}/strategies/*.rb"].sort.each { |file| require(file) }
end
