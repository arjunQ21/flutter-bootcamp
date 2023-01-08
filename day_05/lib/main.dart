import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 5;
  String appBarTitle = "6";
  // Color bgColorOfBox = Colors.blue;

  @override
  Widget build(BuildContext context) {
    print("UI Updated");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    // if (bgColorOfBox == Colors.blue) {
                    //   bgColorOfBox = Colors.red;
                    // } else {
                    //   bgColorOfBox = Colors.blue;
                    // }
                  });
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: (count % 2 == 0) ? Colors.green : Colors.yellow,
                    borderRadius: BorderRadius.circular(10000),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextField(
                  onChanged: (value) {
                    print("Value changed to: " + value);
                    // value = appBarTitle;
                    setState(() {
                      appBarTitle = value;
                    });
                  },
                  decoration: InputDecoration(
                    label: Text("Enter something"),
                  ),
                ),
              ),
              SizedBox(height: 12.0),
              Text("Count"),
              Text(
                count.toString(),
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              count = count + 1;
              appBarTitle = "Count is " + count.toString();
            });
            print(count);
            print(appBarTitle);
          },
        ),
      ),
    );
  }
}
