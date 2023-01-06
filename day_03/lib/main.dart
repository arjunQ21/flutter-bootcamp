import 'package:day03/homework.dart';
import 'package:flutter/material.dart';

void main() {
  // runApp(MyApp());
  runApp(
    MaterialApp(
      home: Scaffold(
        body: SafeArea(child: CustomCard()),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Hello",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.green,
                        size: 45,
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    print("Button Clicked");
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.green),
                    padding: MaterialStateProperty.resolveWith(
                      (states) => EdgeInsets.all(20),
                    ),
                    elevation: MaterialStateProperty.resolveWith((abc) => 10),
                    shape: MaterialStateProperty.resolveWith(
                      (abc) => RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                        side: BorderSide(
                          color: Colors.red,
                          width: 6,
                        ),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.handshake),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Hello",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  height: 500,
                  width: 1000,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/scene.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 500,
                  width: 1000,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/scene.jpeg"),
                        fit: BoxFit.contain),
                  ),
                ),
                Container(
                  height: 500,
                  width: 1000,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/scene.jpeg"),
                        fit: BoxFit.contain),
                  ),
                ),
                Container(
                  height: 500,
                  width: 1000,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/scene.jpeg"),
                        fit: BoxFit.contain),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
