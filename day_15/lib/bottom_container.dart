import 'package:flutter/material.dart';

class BottomContainer extends StatelessWidget {
  Color color;
  String text;

  BottomContainer({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: color,
        child: Center(
            child: Text(
          text,
          style: TextStyle(
            fontSize: 56,
          ),
        )),
      ),
    );
  }
}
