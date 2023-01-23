import 'package:flutter/material.dart';

import 'basic_counter_page.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BasicCounterPage(),
    );
  }
}
