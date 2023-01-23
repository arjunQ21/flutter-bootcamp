import 'package:day_10_homework/screens/register_screen.dart';
import 'package:flutter/material.dart';

// screens
import 'package:day_10_homework/screens/login_screen.dart';
// import 'package:day_10_homework/screens/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Form Validation',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
