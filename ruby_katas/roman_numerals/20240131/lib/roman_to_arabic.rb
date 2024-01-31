# frozen_string_literal: true

class RomanToArabic
  def self.call(roman)
    new(roman).call
  end

  def initialize(roman)
    @negative = roman.start_with?('-')
    @roman = roman.sub('-', '')
  end

  def call
    return convert_positive unless @negative

    -convert_positive
  end

  private

  def convert_positive
    chars_with_index = @roman.chars.each.with_index

    chars_with_index.reduce(0) do |total, char_index|
      char, index = char_index

      operator = get_operator(index)

      total = if operator.negative?
                total - get_value(char)
              else
                total + get_value(char)
              end

      total
    end
  end

  # The operator isolates the logic when we have to deal with
  # roman numbers like IV, where we need to subtract the value of the
  # characters instead of adding, like we do with VI
  def get_operator(index)
    current_char = @roman[index]
    next_char = @roman[index + 1]
    current_value = get_value(current_char)
    next_value = get_value(next_char)

    return -1 if next_value && next_value > current_value

    1
  end

  def get_value(char)
    RomanNumeralsConverter::ROMAN_NUMERALS[char]
  end
end
