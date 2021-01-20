# Algorithm:
# We need to keep flipping pairs of right handed digits (lower weight digits)
# until we get a net big number
#
# Example for 144
# iteration 1
# Flip digit index -1 and index -2
# Results in 144 which is still not greater than the input
#
# Flip digit index -2 and index -3
# Results in 414 which is greater than the input
#
# When choosing right digits to flip, we need to choose digits that are higher
# than the one we are flipping.
# Eg: Input 7890
# Iteration 1:  tail = 0, next_tail= 9
#
#
# Notice that if all digits are the same then we can't get any bigger with
# permutations.
def next_bigger(input)
  puts "input = #{input}"
  puts '------------------'
  puts
  puts

  digits = input.to_s.chars.map(&:to_i)

  return -1 if all_digits_are_the_same?(digits)

  result = input
  tail = -1
  next_tail = -1
  next_tail_digit = nil

  puts 'Starting iterations to find the bigger number by permutating digits from right to left...'
  puts
  while(tail.abs < digits.length && result <= input)
    next_tail = tail -1
    tail_digit = digits[tail]
    next_tail_digit = digits[next_tail]

    if to_number(next_tail_digit, tail_digit) > to_number(tail_digit, next_tail_digit)
      puts "SKIPPING flipping since #{next_tail_digit}#{tail_digit} > #{tail_digit}#{next_tail_digit}"
    else
      puts "FLIPPING digits..."
      puts "digits before = #{digits}"
      digits[tail] = next_tail_digit
      digits[next_tail] = tail_digit
      puts "digits after  = #{digits}"

      result = digits.join.to_i

      puts "tail      = #{tail}  digit = #{tail_digit}"
      puts "next_tail = #{next_tail}  digit = #{next_tail_digit}"
      puts "result = #{result}"
    end

    tail -= 1
    puts "new_tail = #{tail}"
    puts '--'
    puts ''
  end

  return -1 if result == input

  replaced_digit = next_tail_digit
  winning_digit = digits[next_tail]

  puts
  puts "Iterations Completed and Bigger number found: #{result}"
  puts "  - Digit that won was: #{winning_digit}."
  puts "  - It replaced the digit: #{replaced_digit} from input: #{input} at index #{next_tail}."
  puts
  puts "Let see if we can make the number smaller by sorting the numbers to the right from bigger to smaller"

  digits_before = digits.slice(0..next_tail)
  digits_after = digits.slice((next_tail+1)..-1)
  sorted_digits_after = sort_desc(digits_after)

  puts
  puts "digits_before: #{digits_before}, digits_after: #{digits_after}"
  puts "Sorting digits after: #{sorted_digits_after}"
  puts "Resulting Number: #{array_to_number(digits_before + sorted_digits_after)}"
  puts
  puts "Now let see if we can find any number to the right of the winning position that" \
    " is smaller than the number that won #{winning_digit} but bigger than the replaced digit #{replaced_digit}..."

  index_of_digit_smaller_than_winner = sorted_digits_after.find_index { |d| d < winning_digit && d > replaced_digit }

  if index_of_digit_smaller_than_winner
    digit_smaller_than_the_winner = sorted_digits_after[index_of_digit_smaller_than_winner]
    puts
    puts "We found it one! Since the array was already sorted we can trust that the one we found is the smalles one."
    puts "Index: #{index_of_digit_smaller_than_winner} and number: #{digit_smaller_than_the_winner}"
    puts "Lets switch the winning number by this one now."
    puts "Before: #{digits_before} + #{sorted_digits_after}"

    digits_before[-1] = digit_smaller_than_the_winner
    sorted_digits_after[index_of_digit_smaller_than_winner] =  winning_digit

    puts "After: #{digits_before} + #{sorted_digits_after}"
    puts
    puts "We now have to sort the digits again because they may be out of order:"
    sorted_digits_after = sort_desc(sorted_digits_after)
    puts "After Re-Sorting: #{digits_before} + #{sorted_digits_after}"
    puts
  end

  result = digits_before + sorted_digits_after
  result.join.to_i
end

# if all the digits are the same we dont need to compute since the number
# cant get bigger with permutations
def all_digits_are_the_same?(digits)
  digits.uniq.length == 1
end

def to_number(a, b)
  "#{a}#{b}".to_i
end

def array_to_number(array)
  array.join.to_i
end

def sort_desc(digits)
  digits.sort { |a,b| a <=> b }
end
