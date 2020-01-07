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
    const romanToArabic = new RomanToArabic(this.ROMAN_NUMERALS);
    const arabicToRoman = new ArabicToRoman(this.ROMAN_NUMERALS)

    if(typeof(value) === 'string') return romanToArabic.call(value);
    return arabicToRoman.call(value)
  }
}

module.exports = RomanConverter;

class RomanToArabic{
  constructor(romanNumerals){
    this.romanNumerals = romanNumerals;
  }

  call(roman){
    if(!roman.startsWith('-')) return this.execute(roman);
    return -this.execute(roman.replace('-', ''))
  }

  execute(roman){
    return Array.from(roman)
      .map((roman, index) => [roman, index])
      .reduce((result, char_index) => {
        const [char, index] = char_index;
        const value = this.romanNumerals[char];
        const nextValue = this.romanNumerals[roman[index+1]]

        if(nextValue && nextValue > value) {
          result -= value
        } else {
          result += value
        }

        return result;
      }, 0)
  }
}

class ArabicToRoman{
  constructor(romanNumerals){
    this.romanNumerals = romanNumerals;
  }

  call(arabic){
    if(arabic >= 0) return this.execute(arabic)
    return `-${this.execute(-arabic)}`
  }

  execute(arabic){
    let result = ''
    let remaining = arabic

    while(remaining > 0) {
      const [roman, value] = Object.entries(this.romanNumerals).find(r_v => r_v[1] <= remaining)
      result = result.concat(roman)
      remaining -= value
    }

    return result
  }
}
