import 'package:day_04/page1.dart';
import 'package:day_04/page2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Day4());
}

class Day4 extends StatelessWidget {
  const Day4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Page1(),
    );
  }
}
