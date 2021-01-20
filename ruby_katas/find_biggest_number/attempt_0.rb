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

  while(tail.abs < digits.length && result <= input)
    next_tail = tail -1
    tail_digit = digits[tail]
    next_tail_digit = digits[next_tail]

    if to_number(next_tail_digit, tail_digit) > to_number(tail_digit, next_tail_digit)
      puts "Skipping flipping since #{next_tail_digit}#{tail_digit} > #{tail_digit}#{next_tail_digit}"
    else
      puts "Flipping digits..."
      puts "digits before = #{digits}"
      digits[tail] = next_tail_digit
      digits[next_tail] = tail_digit
      puts "digits after  = #{digits}"
    end



    result = digits.join.to_i

    puts "tail      = #{tail}  digit = #{tail_digit}"
    puts "next_tail = #{next_tail}  digit = #{next_tail_digit}"
    puts "result = #{result}"

    tail -= 1
    puts "new_tail = #{tail}"
    puts '--'
    puts ''
  end

  return -1 if result == input
  result
end

# if all the digits are the same we dont need to compute since the number
# cant get bigger with permutations
def all_digits_are_the_same?(digits)
  digits.uniq.length == 1
end

def to_number(a, b)
  puts "To Number: #{a}#{b}"
  "#{a}#{b}".to_i
end

