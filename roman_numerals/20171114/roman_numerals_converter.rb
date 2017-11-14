class RomanNumeralsConverter
  ROMAN_NUMERALS = {
    'M'  => 1000,
    'CM' => 900,
    'D'  => 500,
    'CD' => 400,
    'C'  => 100,
    'XC' => 90,
    'L'  => 50,
    'XL' => 40,
    'X'  => 10,
    'IX' => 9,
    'V'  => 5,
    'IV' => 4,
    'I'  => 1
  }

  def convert(number)
    @number = number
    return arabic_to_roman if number.is_a?(Integer)
    roman_to_arabic
  end

  private

  def arabic_to_roman
    return convert_arabic_to_roman if @number >= 0
    @number = -@number
    "-#{convert_arabic_to_roman}"
  end

  def roman_to_arabic
    if @number =~ /^-/
      @number = @number.sub('-', '')
      -convert_roman_to_arabic
    else
      convert_roman_to_arabic
    end
  end

  def convert_arabic_to_roman
    result = ''
    ROMAN_NUMERALS.each_pair do |roman, arabic|
      while @number >= arabic
        @number -= arabic
        result << roman
      end
    end
    result
  end

  def convert_roman_to_arabic
    result = 0
    @number.chars.each.with_index do |char, i|
      current_n = char_to_number(char)
      next_n = char_to_number(@number[i+1])

      if next_n > current_n
        result -= current_n
      else
        result += current_n
      end
    end
    result
  end

  def char_to_number(char)
    ROMAN_NUMERALS[char] || 0
  end
end
