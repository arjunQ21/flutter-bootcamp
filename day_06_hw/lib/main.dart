import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double leftOffset = 0;

  int direction = 1;

  int incrementOffset = 1;

  @override
  void initState() {
    super.initState();
    moveAutomatically();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          color: Colors.red,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: FlutterLogo(),
              ),
              // Animated
              Positioned(
                // duration: const Duration(milliseconds: 1000),
                top: 50,
                left: leftOffset,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: moveForward,
        child: Text("."),
      ),
    );
  }

  void moveAutomatically() {
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      moveForward();
    });
  }

  void moveForward() {
    setState(() {
      var leftMax = 300 - 100.0;

      if (leftOffset > leftMax) {
        direction = direction * -1;
        leftOffset = leftMax;
      } else if (leftOffset < 0) {
        direction = direction * -1;
        leftOffset = 0;
      }

      leftOffset = leftOffset + incrementOffset * direction;
    });
  }
}
