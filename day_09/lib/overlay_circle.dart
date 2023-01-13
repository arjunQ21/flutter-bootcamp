import 'package:day_09/circle.dart';
import 'package:flutter/material.dart';

class OverlayCircle extends StatelessWidget {
  Color? color;

  OverlayCircle({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Circle(radius: 40, color: color ?? Colors.yellow);
  }
}
