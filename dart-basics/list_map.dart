void main() {
  List<int> inputNumbers = [1, 2, 3, 4, 5];

  // print(inputNumbers.map((v) => v * v).toList());

  // print(inputNumbers.map((v) {
  //   return v * v;
  // }).toList());

  print(inputNumbers.map((e) {
    print("Processing: $e");

    String digit = e.toString();
    return digit + digit;
  }).toList());

  List<String> fruits = [
    'apple',
    'banana',
    'orange',
    'pineapple',
    'mango',
    'strawberry'
  ];

  print(fruits.map((e) => e.toUpperCase()).toList());

  // print("uppercase of apple is: " + "apple".toUpperCase());
}
