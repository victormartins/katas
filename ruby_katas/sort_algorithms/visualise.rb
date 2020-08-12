require_relative 'lib/sorter'
require 'pastel'

COLORS = [
  :white,
  :red,
  :green,
  :yellow,
  :blue,
  :magenta,
  :cyan,
  :bright_black,
  :bright_red,
  :bright_green,
  :bright_yellow,
  :bright_blue,
  :bright_magenta,
  :bright_cyan,
  :bright_white,
  :bright_black
]

@pastel = Pastel.new

NUMBER_OF_ELEMENTS_TO_SORT = 60
SCALE_FACTOR = 14
WAITING_PERIOD = 0.15
MAX_DIGIT = COLORS.length * SCALE_FACTOR

input = []
NUMBER_OF_ELEMENTS_TO_SORT.times do
  input << Random.new.rand((1..MAX_DIGIT))
end

sorter = Sorter.new(input, strategy: Sorter::Strategies::BubbleSort)


def color_index_for(digit)
  ((digit-1)/SCALE_FACTOR)%MAX_DIGIT
end

def print_row(digit)
  color_index = color_index_for(digit)
  color = COLORS[color_index]
  text = ('X' * digit) # + "| #{color_index_for(digit)} (#{color})"
  puts @pastel.public_send(color.to_s, text)
rescue Pastel::InvalidAttributeNameError
  puts "Invalid color sent! Color: #{color} for digit #{digit} and index #{color_index}"
end

def print_rows(rows)
  rows.each do |digit|
    print_row(digit)
  end
end

system('clear')
print_rows(sorter.result)
sleep(WAITING_PERIOD)

until sorter.completed? do
  system('clear')
  print_rows(sorter.result)
  sorter.tick
  sleep(WAITING_PERIOD)
end
