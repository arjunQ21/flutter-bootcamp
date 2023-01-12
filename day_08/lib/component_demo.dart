import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:messenger_hw/messenger_ui.dart';

import 'mero_box.dart';

class ComponentsPage extends StatelessWidget {
  const ComponentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MeroBox(
              width: 50,
              height: 100,
            ),
            MeroBox(
              width: 45,
            ),
            MeroBox(
              width: 20,
              colorOfBox: Colors.red,
            ),
            MeroBox(
              width: 78,
            ),
            MeroBox(
              width: 43,
            ),
          ],
        ),
      ),
    );
  }
}
