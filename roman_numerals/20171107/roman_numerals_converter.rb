class RomanNumeralsConverter
  ROMAN_NUMERALS = {
    'I'  => 1,
    'IV' => 4,
    'V'  => 5,
    'X'  => 10,
    'L'  => 50,
    'C'  => 100,
    'D'  => 500,
    'M'  => 1000

  }
  def convert(number)
    if number.is_a?(Integer)
      if number < 0
        '-' + roman_numeral_for(number*-1)
      else
        roman_numeral_for(number)
      end
    else
      result = 0
      number.chars.each do |char|
        result += ROMAN_NUMERALS[char] || 0
      end
      result
    end
  end

  private

  def roman_numeral_for(number)
    result = ''

    while number >= 1000
      result << 'M'
      number -= 1000
    end

    while number >= 900
      result << 'CM'
      number -= 900
    end

    while number >= 500
      result << 'D'
      number -= 500
    end

    while number >= 400
      result << 'CD'
      number -= 400
    end

    while number >= 100
      result << 'C'
      number -= 100
    end

    while number >= 90
      result << 'XC'
      number -= 90
    end

    while number >= 50
      result << 'L'
      number -= 50
    end

    while number >= 40
      result << 'XL'
      number -= 40
    end

    while number >= 10
      result << 'X'
      number -= 10
    end

    while number >= 9
      result << 'IX'
      number -= 9
    end

    while number >= 5
      result << 'V'
      number -= 5
    end

    while number >= 4
      result << 'IV'
      number -= 4
    end

    while number > 0
      result << 'I'
      number -= 1
    end

    result
  end
end
