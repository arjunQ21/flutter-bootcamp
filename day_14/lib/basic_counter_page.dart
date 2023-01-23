import 'package:day_14/count_changer.dart';
import 'package:flutter/material.dart';

import 'show_big_number.dart';

class BasicCounterPage extends StatefulWidget {
  const BasicCounterPage({super.key});

  @override
  State<BasicCounterPage> createState() => _BasicCounterPageState();
}

class _BasicCounterPageState extends State<BasicCounterPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic Counter"),
      ),
      body: Column(
        children: [
          CountChanger(onCountChanged: (val) {
            setState(() {
              count = val;
            });
          }),
          Divider(
            thickness: 5,
            color: Colors.red,
          ),
          ShowBigNumber(count: count),
        ],
      ),
    );
  }
}
