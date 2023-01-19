int giveMeEstablisedDate() {
  return 1998;
}

void main() {
  int estd = 1998;
  String abc = "GCES";

  print(abc + " establised at: " + estd.toString());

  print("$abc establised at: $estd");

  print("$abc establised at: ${giveMeEstablisedDate()}");
}
