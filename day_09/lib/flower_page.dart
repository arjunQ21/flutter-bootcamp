import 'package:day_09/overlay_circle.dart';
import 'package:flutter/material.dart';

import 'circle.dart';

class FlowerPage extends StatelessWidget {
  const FlowerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.8,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.red,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Circle(
                      radius: 70,
                      color: Colors.black,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Circle(
                      radius: 45,
                      color: Colors.green,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Circle(
                      radius: 30,
                      color: Colors.blue,
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 38,
                    child: OverlayCircle(),
                  ),
                  Positioned(
                    top: 150,
                    left: 23,
                    child: OverlayCircle(
                      color: Colors.purple,
                    ),
                  ),
                  Positioned(
                    top: 220,
                    left: 70,
                    child: OverlayCircle(),
                  ),
                  // Positioned(
                  //   top: 0,
                  //   left: 0,
                  //   child: OverlayCircle(),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
