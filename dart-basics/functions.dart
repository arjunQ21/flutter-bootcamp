String giveMeHi() {
  return "Hi";
}

void main() {
  print(giveMeHi());
  print("The sum of 5 and 6 is: ${add(5, 6)}");

  print("The sum of 5 and 6, with named arguments is: ${add2(a: 5, b: 6)}");

  print("The sum of 5 and 6, with optional arguments is: ${addOptional(b: 6)}");

  print("The sum of 5 and 6, with both arguments is: ${addBoth(5, c: 6)}");
}

double add(double c, double b) {
  return c + b;
}

double add2({required double a, required double b}) {
  return a + b;
}

double addOptional({double? a: 0, required double b}) {
  return a! + b;
}

double addOptional2({double? a, required double b}) {
  return b + (a ?? 0);
}

// function with both positional and named arguments

double addBoth(double a, {double? c}) {
  return a + (c ?? 0);
}

// not possible
// double addBoth2({double? c}, double a ){

// return a + (c ?? 0);

// }




