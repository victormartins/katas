const  ROMAN_NUMERALS = {
    'M' : 1000,
    'CM': 900,
    'D' : 500,
    'CD': 400,
    'C' : 100,
    'XC': 90,
    'L' : 50,
    'XL': 40,
    'X' : 10,
    'IX': 9,
    'V' : 5,
    'IV': 4,
    'I' : 1
  }

class RomanConverter {
  static convert(value) {
    if(typeof(value) === 'string'){
      return new RomanToArabic().call(value)
    }else{
      return new ArabicToRoman().call(value)
    }
  }
}

class RomanToArabic {
  call(roman) {
    const positiveRoman = !roman.startsWith('-')

    if(positiveRoman) {
      return(this.execute(roman)      )
    } else {
      return(-this.execute(roman.replace('-', '')))
    }
  }

  execute(roman){
    return Array.from(roman)
      .map((char, index) => [char, index])
      .reduce((result, char_index) => {
        const char = char_index[0]
        const index = char_index[1]
        const value = ROMAN_NUMERALS[char]
        const next_value = ROMAN_NUMERALS[roman[index + 1]]

        if(next_value && next_value > value) {
          result -= value
        } else {
          result += value
        }

        return(result)
      }, 0)
  }
}

class ArabicToRoman {
  call(number){
    if(number >= 0){
      return this.execute(number);
    } else {
      return `-${this.execute(-number)}`
    }
  }

  execute(number){
    let result = '';
    let remainder = number;

    while (remainder > 0) {
      const roman_value = Object.entries(ROMAN_NUMERALS).find((r_v) => {
        const [_roman, value] = r_v;
        return(value <= remainder)
      })

      const [roman, value] = roman_value;

      remainder -= value;

      result = result.concat(roman)
    }


    return(result )
  }
}

module.exports = RomanConverter;
