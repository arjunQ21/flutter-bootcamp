import 'package:flutter/material.dart';

class MeroBox extends StatelessWidget {
  Color? colorOfBox;
  double? height;
  double width;
  MeroBox(
      {super.key,
      this.colorOfBox: Colors.blue,
      this.height,
      required this.width}) {
    // colorOfBox = Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8),
        height: height,
        width: width,
        color: colorOfBox,
        child: Text("Hi"),
      ),
    );
  }
}
