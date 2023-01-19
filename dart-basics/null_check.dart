void main() {
  int a = 5;

  int? b ;

  // b = null;

  int? c;

  c = b;

  a = c ?? 57;

  print(c ?? 56);
}
