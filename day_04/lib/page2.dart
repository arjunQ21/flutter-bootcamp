import 'package:day_04/page1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Page 2"),
            ElevatedButton(
              onPressed: () {
                // not preferred
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (context) => Page1()),
                // );
                Navigator.of(context).pop();
              },
              child: Text("GO back"),
            ),
          ],
        ),
      ),
    );
  }
}
