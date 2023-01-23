import 'package:flutter/material.dart';

class CountChanger extends StatefulWidget {
  // return Type Function (argument Types)
  void Function(int) onCountChanged;

  // void onCountChanged(int a) {
  //   print("in parent widget");
  // }

  CountChanger({
    required this.onCountChanged,
    super.key,
  });

  @override
  State<CountChanger> createState() => _CountChangerState();
}

class _CountChangerState extends State<CountChanger> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                setState(() {
                  count--;
                });
                widget.onCountChanged(count);
              },
              icon: Icon(Icons.minimize)),
          Container(width: 100, child: Center(child: Text(count.toString()))),
          IconButton(
              onPressed: () {
                setState(() {
                  count++;
                });
                widget.onCountChanged(count);
              },
              icon: Icon(Icons.add)),
        ],
      ),
    );
  }
}
