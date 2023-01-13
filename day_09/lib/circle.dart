import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Circle extends StatelessWidget {
  double radius;
  Color color;
  Circle({super.key, required this.radius, required this.color});

  @override
  Widget build(BuildContext context) {
    // return Align(
    //   alignment: Alignment.center,
    //   child: Container(
    //     height: radius * 2,
    //     width: radius * 2,
    //     decoration: BoxDecoration(
    //       color: color,
    //       borderRadius: BorderRadius.circular(radius * 2),
    //     ),
    //   ),
    // );

    return CircleAvatar(
      backgroundColor: color,
      radius: radius,
    );
  }
}
