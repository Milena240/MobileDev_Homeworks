int sumNested(dynamic obj) {
  switch (obj) {
    case int n:
      return n;
    case double d:
      return d.floor();
    case String s:
      return sumAscii(s);
    case List list:
      var total = 0;
      for (var item in list) {
        total += sumNested(item);
      }
      return total;
    case Map m:
      var total = 0;
      for (var value in m.values) {
        total += sumNested(value);
      }
      return total;
    case (var a, var b): 
      return sumNested(a) + sumNested(b);
    case (first: var a, second: var b):
      return sumNested(a) + sumNested(b);
    default:
      return 0;
  }
}

int sumAscii(String s) {
  var total = 0;
  for (var codeUnit in s.codeUnits) {
    total += codeUnit;
  }
  return total;
}

void main() {
  print(sumNested(1)); 
  print(sumNested([2, 3, 4])); 
  print(sumNested({'a': 5, 'b': ["ab", 7]})); 
  print(sumNested((first: 8, second: "c"))); 
  print(sumNested({'c': (first: 10, second: ["xy", 12])})); 
  print(sumNested("z")); 
  print(sumNested(13.5)); 
  print(sumNested([14, {'d': 15, 'e': (first: "p", second: 17)}])); 
  print(1 + 9 + 207 + 107 + 263 + 122 + 13 + 158); 
}

