Future<dynamic> show(int a) {
  return Future.delayed(Duration(seconds: 2), () {
    print(a);
    return 78;
  });
}

void main() async {
  print(1);
  print(await show(5));
  print(2);
  show(6);
  print(3);
}
