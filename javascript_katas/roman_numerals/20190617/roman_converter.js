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
    const arabicToRoman = new ArabicToRoman();
    const romanToArabic = new RomanToArabic();

    if(typeof(value) !== 'string') return  arabicToRoman.call(value)
    else return romanToArabic.call(value)
  }
}

class ArabicToRoman {
  call(number) {
    if(number >= 0) return this.execute(number)
    else return `-${this.execute(-number)}`
  }

  execute(number) {
    let result = ''
    let remainder = number

    while(remainder > 0) {
      const roman_arabic = Object.entries(ROMAN_NUMERALS).find((r_a) => {
        return r_a[1] <= remainder;
      })


      const [roman, arabic] = roman_arabic;

      result = result.concat(roman)
      remainder -= arabic;
    }

    return result
  }
}

class RomanToArabic {
  call(roman) {
    if(!roman.startsWith('-')) return this.execute(roman)
    else return -this.execute(roman.replace('-', ''))
  }

  execute(roman) {
    return Array.from(roman)
    .map((char, index) => ([char, index]))
    .reduce((result, char_index) => {
      const [char, index] = char_index;
      const value = ROMAN_NUMERALS[char];
      const next_value = ROMAN_NUMERALS[roman[index + 1]]

      if(next_value && next_value > value) {
        result -= value
      } else {
        result += value
      }

      return result
    }, 0)
  }
}

module.exports = RomanConverter;
