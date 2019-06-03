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
    if(typeof value === 'number') {
      return(new ArabicToRoman().convert(value))
    } else {
      return(new RomanToArabic().convert(value))
    }
  }
}

class ArabicToRoman{
  convert(number) {
    if(number >= 0) {
      return this.execute(number)
    } else {
      return `-${this.execute(-number)}`
    }
  }
  execute(number)  {
    let result = ''
    let remainder = number

    while (remainder > 0) {
      const roman_value = Object.entries(ROMAN_NUMERALS).find((r_v) =>{
        return(r_v[1] <= remainder)
      })

      const roman = roman_value[0]
      const value = roman_value[1]

      result = result.concat(roman)
      remainder -= value
    }

    return result
  }
}

class RomanToArabic{
  convert(roman) {
    if(!roman.startsWith('-')){
      return(this.execute(roman))
    }else{
      return(-this.execute(roman.replace('-', '')))
    }
  }

  execute(roman){
    const result = Array.from(roman).map((char, index) => {
      const value = ROMAN_NUMERALS[char]
      const next_value = ROMAN_NUMERALS[roman[index + 1]]
      let subtract = false

      // console.log('R', roman, 'V: ', value, 'NV: ', next_value);

      if(next_value !== undefined && next_value > value) {
        subtract = true
      }

      return([value, subtract])
    }).reduce((result, value_subtract) => {
      const value = value_subtract[0]
      const subtract = value_subtract[1]

      if(subtract){
        return(result -= value)
      } else {
        return(result += value)
      }
    }, 0)

    // console.log('RESULT: ', result);

    return(result)

  }
}

module.exports = RomanConverter;
