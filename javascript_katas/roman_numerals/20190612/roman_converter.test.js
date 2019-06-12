const RomanConverter = require('./roman_converter')

describe('RomanNumeralsConverter', () => {
  describe('converting arabic to roman', () => {
    test('conversion', () => {
      expect(RomanConverter.convert(1)).toEqual('I')
    });

    test('conversion', () => {
      expect(RomanConverter.convert(3)).toEqual('III')
    });

    test('conversion', () => {
      expect(RomanConverter.convert(4)).toEqual('IV')
    });

    test('conversion', () => {
      expect(RomanConverter.convert(5)).toEqual('V')
    });

    test('conversion', () => {
      expect(RomanConverter.convert(6)).toEqual('VI')
    });

    test('conversion', () => {
      expect(RomanConverter.convert(8)).toEqual('VIII')
    });

    test('conversion', () => {
      expect(RomanConverter.convert(9)).toEqual('IX')
    });

    test('conversion', () => {
      expect(RomanConverter.convert(10)).toEqual('X')
    });

    test('conversion', () => {
      expect(RomanConverter.convert(20)).toEqual('XX')
    });

    test('conversion', () => {
      expect(RomanConverter.convert(40)).toEqual('XL')
    });

    test('conversion', () => {
      expect(RomanConverter.convert(50)).toEqual('L')
    });

    test('conversion', () => {
      expect(RomanConverter.convert(90)).toEqual('XC')
    });

    test('conversion', () => {
      expect(RomanConverter.convert(100)).toEqual('C')
    });

    test('conversion', () => {
      expect(RomanConverter.convert(400)).toEqual('CD')
    });

    test('conversion', () => {
      expect(RomanConverter.convert(500)).toEqual('D')
    });

    test('conversion', () => {
      expect(RomanConverter.convert(900)).toEqual('CM')
    });

    test('conversion', () => {
      expect(RomanConverter.convert(1000)).toEqual('M')
    });

    test('conversion', () => {
      expect(RomanConverter.convert(2013)).toEqual('MMXIII')
    });

    test('conversion', () => {
      expect(RomanConverter.convert(3999)).toEqual('MMMCMXCIX')
    });

    test('conversion', () => {
      expect(RomanConverter.convert(0)).toEqual('')
    });

    test('conversion', () => {
      expect(RomanConverter.convert(-1)).toEqual('-I')
    });

  });

  describe('converting roman to arabic', () => {
    test('conversion', () => {
      expect(RomanConverter.convert('I')).toEqual(1);
    });

    test('conversion', () => {
      expect(RomanConverter.convert('III')).toEqual(3);
    });

    test('conversion', () => {
      expect(RomanConverter.convert('IV')).toEqual(4);
    });

    test('conversion', () => {
      expect(RomanConverter.convert('V')).toEqual(5);
    });

    test('conversion', () => {
      expect(RomanConverter.convert('VI')).toEqual(6);
    });

    test('conversion', () => {
      expect(RomanConverter.convert('VIII')).toEqual(8);
    });

    test('conversion', () => {
      expect(RomanConverter.convert('IX')).toEqual(9);
    });

    test('conversion', () => {
      expect(RomanConverter.convert('X')).toEqual(10);
    });

    test('conversion', () => {
      expect(RomanConverter.convert('XX')).toEqual(20);
    });

    test('conversion', () => {
      expect(RomanConverter.convert('XL')).toEqual(40);
    });

    test('conversion', () => {
      expect(RomanConverter.convert('L')).toEqual(50);
    });

    test('conversion', () => {
      expect(RomanConverter.convert('XC')).toEqual(90);
    });

    test('conversion', () => {
      expect(RomanConverter.convert('C')).toEqual(100);
    });

    test('conversion', () => {
      expect(RomanConverter.convert('CD')).toEqual(400);
    });

    test('conversion', () => {
      expect(RomanConverter.convert('D')).toEqual(500);
    });

    test('conversion', () => {
      expect(RomanConverter.convert('CM')).toEqual(900);
    });

    test('conversion', () => {
      expect(RomanConverter.convert('M')).toEqual(1000);
    });

    test('conversion', () => {
      expect(RomanConverter.convert('MMXIII')).toEqual(2013);
    });

    test('conversion', () => {
      expect(RomanConverter.convert('MMMCMXCIX')).toEqual(3999);
    });

    test('conversion', () => {
      expect(RomanConverter.convert('')).toEqual(0);
    });

    test('conversion', () => {
      expect(RomanConverter.convert('-I')).toEqual(-1);
    });
  });
})
