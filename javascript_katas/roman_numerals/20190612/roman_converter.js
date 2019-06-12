  ROMAN_NUMERALS = {
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
    const arabicToRoman = new ArabicToRoman()
    const romanToArabic = new RomanToArabic()

    // split concerns into well defined responsabilities
    if(typeof(value) !== 'string') return arabicToRoman.call(value)
    else return romanToArabic.call(value)
  }
}

class ArabicToRoman { call(value) {
    if(value >=0 ) {
      // default case
      return this.execute(value)
    } else {
      // normalize input to match default case
      // introduce special case in the return
      return `-${this.execute(-value)}`
    }
  }

  execute(value) {
    let result = ''
    let remainder = value

    while(remainder > 0) {
      const roman_arabic = Object.entries(ROMAN_NUMERALS).find((r_v) => { return r_v[1] <= remainder })

      const [roman, arabic] = roman_arabic

      result = result.concat(roman)
      remainder -= arabic
    }

    return(result)
  }
}

class RomanToArabic { call(roman) {
    if(!roman.startsWith('-')) { return this.execute(roman) }
    else { return -this.execute(roman.replace('-', '')) }
  }

  execute(roman) {
    return Array.from(roman)
      .map((char, index) => {return [char, index]})
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
      },0)
  }
}

module.exports = RomanConverter;
