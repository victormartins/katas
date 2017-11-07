class RomanNumeralsConverter
  ROMAN_NUMERALS = {
    'I' => 1,
    'V' => 5
  }
  def convert(number)
    roman_numeral_for(number)
  end

  private

  def roman_numeral_for(number)
    result = ''
    while number >= 5
      result << 'V'
      number -= 5
    end
    while number > 0
      result << 'I'
      number -= 1
    end
    result

    # if number <=8
    #   return 'V' + 'I'*number
    # end

    # ROMAN_NUMERALS.detect { |k, v| v == number }.first
  end
end
