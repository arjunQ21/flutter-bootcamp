void main() {
  double score = 85.6;

  print(score);

  print("Ram scored " + score.toString() + "% in SLC.");

  var opacityOfBox = 0.343;

  double inPercentage = opacityOfBox * 100;

  print("A box is " + inPercentage.toStringAsFixed(1) + "% visible.");

  print("A box is " + (opacityOfBox * 100).toStringAsFixed(1) + "% visible.");

  print("Type of opacityOfBox variable is: " +
      opacityOfBox.runtimeType.toString());

  var height = 5.0;
  // dynamic height;
  // height = 5;
  height = height * 0.2;

  print("Half of my height is: " + (height / 2).toString());
}
