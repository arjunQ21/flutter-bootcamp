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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        count--;
                      });
                    },
                    icon: Icon(Icons.minimize)),
                Container(
                    width: 100, child: Center(child: Text(count.toString()))),
                IconButton(
                    onPressed: () {
                      setState(() {
                        count++;
                      });
                    },
                    icon: Icon(Icons.add)),
              ],
            ),
          ),
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
