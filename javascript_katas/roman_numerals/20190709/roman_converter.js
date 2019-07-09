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
    if(typeof(value) === 'string') return new RomanToArabic(this.ROMAN_NUMERALS).call(value)
    else return new ArabicToRoman(this.ROMAN_NUMERALS).call(value)
  }
}

class ArabicToRoman{
  constructor(romanNumerals) {
    this.romanNumerals = romanNumerals;
  }
  call(value){
    if(value >= 0) return this.execute(value)
    else return `-${this.execute(-value)}`
  }

  execute(value){
    let result = ''
    let remainder = value

    while (remainder > 0) {
      const romanArabic = Object.entries(this.romanNumerals).find((r_v) => (r_v[1] <= remainder))
      const [roman, arabic] = romanArabic

      remainder -= arabic;
      result = result.concat(roman);
    }

    return result
  }
}

class RomanToArabic{
  constructor(romanNumerals){
    this.romanNumerals = romanNumerals;
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
        const value = this.romanNumerals[char];
        const nextValue = this.romanNumerals[roman[index + 1]]

        if(nextValue && nextValue > value) return result -= value
        else return result += value
      }, 0)
  }
}

module.exports = RomanConverter;
