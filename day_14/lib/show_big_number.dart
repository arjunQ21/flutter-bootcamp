import 'package:flutter/material.dart';

class ShowBigNumber extends StatelessWidget {
  const ShowBigNumber({
    Key? key,
    required this.count,
  }) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      color: Colors.purple[900],
      child: Center(
          child: Text(
        count.toString(),
        style: TextStyle(
          fontSize: 58,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      )),
    ));
  }
}
