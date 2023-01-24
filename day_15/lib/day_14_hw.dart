import 'package:day_15/bottom_container.dart';
import 'package:flutter/material.dart';

import 'switch_and_text_controller.dart';

class Day14HomeworkPage extends StatefulWidget {
  const Day14HomeworkPage({super.key});

  @override
  State<Day14HomeworkPage> createState() => _Day14HomeworkPageState();
}

class _Day14HomeworkPageState extends State<Day14HomeworkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 15 Homework'),
      ),
      body: Column(
        children: [
          SwitchAndInputController(
              // onColorChanged: (p0) {
              //   print("Color Changed detected in main page");
              //   setState(() {
              //     colorOfContainer = p0;
              //   });
              // },
              // onInputChanged: (p0) {
              //   print("Input Changed detected in main page");
              //   setState(() {
              //     textToShow = p0;
              //   });
              // },
              ),
          BottomContainer(),
        ],
      ),
    );
  }
}
