import 'package:flutter/material.dart';
import 'package:voting_system/screens/home_screen.dart';
import 'package:voting_system/screens/splash_screen.dart';
import '/screens/login_screen.dart';

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
