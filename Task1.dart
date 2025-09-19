class NumberToWords {
  static const List<String> ones = [
    "zero", "one", "two", "three", "four", "five",
    "six", "seven", "eight", "nine", "ten", "eleven",
    "twelve", "thirteen", "fourteen", "fifteen", "sixteen",
    "seventeen", "eighteen", "nineteen"
  ];

  static const List<String> tensWords = [
     "twenty", "thirty", "forty", "fifty",
    "sixty", "seventy", "eighty", "ninety"
  ];

  static String numberToWords(int n) {
    if (n == 0) return ones[0];

    int millions = n ~/ 1000000;
    int thousands = (n ~/ 1000) % 1000;
    int remainder = n % 1000;

    List<String> result = [];

    if (millions > 0) {
      result.add(threeDigitToWords(millions));
      result.add("million");
    }
    if (thousands > 0) {
      result.add(threeDigitToWords(thousands));
      result.add("thousand");
    }
    if (remainder > 0) {
      result.add(threeDigitToWords(remainder));
    }
    return result.join(" ");
  }

  static String threeDigitToWords(int n) {
    int hundreds = n ~/ 100;
    int remainder = n % 100;
    List<String> parts = [];

    if (hundreds > 0) {
      parts.add(ones[hundreds]);
      parts.add("hundred");
    }
    if (remainder > 0) {
      parts.add(twoDigitToWords(remainder));
    }
    return parts.join(" ");
  }

  static String twoDigitToWords(int n) {
    if (n < 20) return ones[n];
    int tens = n ~/ 10;
    int unit = n % 10;
    if (unit == 0) return tensWords[tens - 2];
    return "${tensWords[tens - 2]} ${ones[unit]}";
  }
}

void main() {
  print(NumberToWords.numberToWords(0));
  print(NumberToWords.numberToWords(6)); 
  print(NumberToWords.numberToWords(42)); 
  print(NumberToWords.numberToWords(123)); 
  print(NumberToWords.numberToWords(900)); 
  print(NumberToWords.numberToWords(8379)); 
  print(NumberToWords.numberToWords(1234567));
  print(NumberToWords.numberToWords(1000000));
  print(NumberToWords.numberToWords(999999999));
}

