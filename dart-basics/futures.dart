int n1 = 1;

Future<dynamic> show(int a) {
  return Future.delayed(Duration(seconds: ++n1), () {
    print(a);
    // if (a == 5) throw Exception("Senti vayo");
    return 78;
  });
}

void main() async {
  print(1);
  show(5);
  print(2);
  show(6);
  print(3);

  // print(1);
  // .then is executed when future completes with a value
  // .catchError is executed when future completes with an error
  // await show(4).then((value) {
  //   print("Obtained value: $value");
  // }).catchError((error) {
  //   print("Obtained error: $error");
  // });
  // print(2);
}
