import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Page 2"),
            ElevatedButton(
              onPressed: () {
                // not preferred
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (context) => Page1()),
                // );
                Navigator.of(context).pop();
              },
              child: const Text("GO back"),
            ),
          ],
        ),
      ),
    );
  }
}
