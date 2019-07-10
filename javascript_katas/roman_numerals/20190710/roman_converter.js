class RomanConverter {
  static ROMAN_NUMERALS = {
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

  static convert(value) {
    const romanToArabic = new RomanToArabic(this.ROMAN_NUMERALS)
    const arabicToRoman = new ArabicToRoman(this.ROMAN_NUMERALS)

    if(typeof(value) === 'string') return romanToArabic.call(value)
    else return arabicToRoman.call(value)
  }
}

class RomanToArabic{
  constructor(romanNumerals){
    this.romanNumerals = romanNumerals
  }

  call(roman){
    if(!roman.startsWith('-')) return this.execute(roman)
    else return -this.execute(roman.replace('-', ''))
  }

  execute(roman){
    return Array.from(roman)
      .map((char, index) => ([char, index]))
      .reduce((result, char_index) => {
        const [char, index] = char_index;
        const value = this.romanNumerals[char]
        const next_value = this.romanNumerals[roman[index+1]]

        if(next_value && next_value > value){
          result -= value
        }else {
          result += value
        }

        return result
      }, 0)
  }
}

class ArabicToRoman{
  constructor(romanNumerals){
    this.romanNumerals = romanNumerals
  }

  call(number){
    if(number >= 0) return this.execute(number)
    else return `-${this.execute(-number)}`
  }

  execute(number){
    let result = ''
    let remainder = number

    while(remainder > 0){
      const roman_arabic = Object.entries(this.romanNumerals).find((r_v) => (r_v[1] <= remainder))
      const [roman, arabic] = roman_arabic

      result = result.concat(roman)
      remainder -= arabic
    }

    return result
  }
}

module.exports = RomanConverter;
