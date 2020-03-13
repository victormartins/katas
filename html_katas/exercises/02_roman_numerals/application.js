// TODO: Validate input to force numbers/letters
// TODO: Handle deletion key and update fields

document.addEventListener("DOMContentLoaded", () => {
  const roman_to_arabic = document.querySelector('.js--roman_to_arabic');
  const arabic_to_roman = document.querySelector('.js--arabic_to_roman');


  const handleRomanKeyPress = (evt) => {
    const {key, target: {value}} = evt;
    const roman = `${value}${key}`.toUpperCase();

    const result = RomanConverter.convert(roman);
    arabic_to_roman.value = result;
  }

  const handleRomanChange = (evt) => {
    const {target, target: {value}} = evt;
    const arabic = RomanConverter.convert(value.toUpperCase());
    const roman = RomanConverter.convert(arabic);
    target.value = roman;
    arabic_to_roman.value = arabic;
  }

  const handleArabicKeyPress = (evt) => {
    const {key, target: {value}} = evt;

    const arabic = Number(`${value}${key}`);
    console.log(`Key: ${key} value: ${value} arabic: ${arabic}`);
    const result = RomanConverter.convert(arabic);
    roman_to_arabic.value = result;
  }

  const handleArabicChange = (evt) => {
    const {target, target: {value}} = evt;
    const roman = RomanConverter.convert(Number(value));
    console.log('WHOT:', roman, "VALUE ", value);

    roman_to_arabic.value = roman;

  }

  roman_to_arabic.onkeypress = handleRomanKeyPress;
  roman_to_arabic.onchange = handleRomanChange;
  arabic_to_roman.onkeypress = handleArabicKeyPress;
  arabic_to_roman.onchange = handleArabicChange;
});
