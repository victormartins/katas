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
    return arabicToRoman.call(value)
  }
}

class RomanToArabic{
  constructor(romanNumerals){
    this.romanNumerals = romanNumerals
  }

  call(roman){
    if(!roman.startsWith('-')) return this.execute(roman)
    return -this.execute(roman.replace('-', ''))
  }

  execute(roman){
    return Array.from(roman)
      .map((char, index) => ([char, index]))
      .reduce((result, char_index) => {
        const char = char_index[0]
        const index = char_index[1]
        const value = this.romanNumerals[char]
        const nextValue = this.romanNumerals[roman[index+1]]

        if(nextValue && nextValue > value){
          result -= value
        } else {
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

  call(arabic){
    if(arabic >= 0) return this.execute(arabic)
    return `-${this.execute(-arabic)}`
  }

  execute(arabic){
    let result = ''
    let remainder = arabic;

    while(remainder > 0) {
      const romanArabic = Object.entries(this.romanNumerals).find(r_v => (r_v[1] <= remainder))
      const roman = romanArabic[0]
      const value = romanArabic[1]

      result = result.concat(roman)
      remainder -= value
    }


    return result
  }
}

module.exports = RomanConverter;
