const RomanConverter = require('./roman_converter')

describe('RomanNumeralsConverter', () => {
  describe('converting arabic to roman', () => {
    it('conversion', () => {
      expect(RomanConverter.convert(1)).toEqual('I')
    });

    it('conversion', () => {
      expect(RomanConverter.convert(3)).toEqual('III')
    });

    it('conversion', () => {
      expect(RomanConverter.convert(4)).toEqual('IV')
    });

    it('conversion', () => {
      expect(RomanConverter.convert(5)).toEqual('V')
    });

    it('conversion', () => {
      expect(RomanConverter.convert(6)).toEqual('VI')
    });

    it('conversion', () => {
      expect(RomanConverter.convert(8)).toEqual('VIII')
    });

    it('conversion', () => {
      expect(RomanConverter.convert(9)).toEqual('IX')
    });

    it('conversion', () => {
      expect(RomanConverter.convert(10)).toEqual('X')
    });

    it('conversion', () => {
      expect(RomanConverter.convert(20)).toEqual('XX')
    });

    it('conversion', () => {
      expect(RomanConverter.convert(40)).toEqual('XL')
    });

    it('conversion', () => {
      expect(RomanConverter.convert(50)).toEqual('L')
    });

    it('conversion', () => {
      expect(RomanConverter.convert(90)).toEqual('XC')
    });

    it('conversion', () => {
      expect(RomanConverter.convert(100)).toEqual('C')
    });

    it('conversion', () => {
      expect(RomanConverter.convert(400)).toEqual('CD')
    });

    it('conversion', () => {
      expect(RomanConverter.convert(500)).toEqual('D')
    });

    it('conversion', () => {
      expect(RomanConverter.convert(900)).toEqual('CM')
    });

    it('conversion', () => {
      expect(RomanConverter.convert(1000)).toEqual('M')
    });

    it('conversion', () => {
      expect(RomanConverter.convert(2013)).toEqual('MMXIII')
    });

    it('conversion', () => {
      expect(RomanConverter.convert(3999)).toEqual('MMMCMXCIX')
    });

    it('conversion', () => {
      expect(RomanConverter.convert(0)).toEqual('')
    });

    it('conversion', () => {
      expect(RomanConverter.convert(-1)).toEqual('-I')
    });

  });

  describe('converting roman to arabic', () => {
    it('conversion', () => {
      expect(RomanConverter.convert('I')).toEqual(1);
    });

    it('conversion', () => {
      expect(RomanConverter.convert('III')).toEqual(3);
    });

    it('conversion', () => {
      expect(RomanConverter.convert('IV')).toEqual(4);
    });

    it('conversion', () => {
      expect(RomanConverter.convert('V')).toEqual(5);
    });

    it('conversion', () => {
      expect(RomanConverter.convert('VI')).toEqual(6);
    });

    it('conversion', () => {
      expect(RomanConverter.convert('VIII')).toEqual(8);
    });

    it('conversion', () => {
      expect(RomanConverter.convert('IX')).toEqual(9);
    });

    it('conversion', () => {
      expect(RomanConverter.convert('X')).toEqual(10);
    });

    it('conversion', () => {
      expect(RomanConverter.convert('XX')).toEqual(20);
    });

    it('conversion', () => {
      expect(RomanConverter.convert('XL')).toEqual(40);
    });

    it('conversion', () => {
      expect(RomanConverter.convert('L')).toEqual(50);
    });

    it('conversion', () => {
      expect(RomanConverter.convert('XC')).toEqual(90);
    });

    it('conversion', () => {
      expect(RomanConverter.convert('C')).toEqual(100);
    });

    it('conversion', () => {
      expect(RomanConverter.convert('CD')).toEqual(400);
    });

    it('conversion', () => {
      expect(RomanConverter.convert('D')).toEqual(500);
    });

    it('conversion', () => {
      expect(RomanConverter.convert('CM')).toEqual(900);
    });

    it('conversion', () => {
      expect(RomanConverter.convert('M')).toEqual(1000);
    });

    it('conversion', () => {
      expect(RomanConverter.convert('MMXIII')).toEqual(2013);
    });

    it('conversion', () => {
      expect(RomanConverter.convert('MMMCMXCIX')).toEqual(3999);
    });

    it('conversion', () => {
      expect(RomanConverter.convert('')).toEqual(0);
    });

    it('conversion', () => {
      expect(RomanConverter.convert('-I')).toEqual(-1);
    });
  });
})
