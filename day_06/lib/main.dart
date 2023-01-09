import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> fruits = [
    "Apple",
    "Banana",
    "Mango",
    "Guava",
    "Papaya",
    "Cucumber",
    "Raddish"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lists"),
      ),
      body: ListView.builder(
          itemCount: fruits.length,
          itemBuilder: (context, i) {
            // print("Building " + fruits[i]);
            return Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: ListTile(
                onTap: () {
                  print("clicked on " + fruits[i]);
                  // add to end
                  // fruits.add(fruits[i]);

                  // add to beginning
                  fruits.insert(0, fruits[i]);
                  print(fruits);
                  setState(() {});
                },
                leading: Icon(Icons.ac_unit),
                title: Text(
                  fruits[i],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
              ),
            );
          }),
      // body: ListView(
      //   children: [
      //     ListTile(
      //       title: Text("Apple"),
      //       leading: Icon(Icons.apple),
      //     ),
      //     ListTile(
      //       title: Text("Banana"),
      //       leading: Icon(Icons.apple),
      //     ),
      //     ListTile(
      //       title: Text("Mango"),
      //       leading: Icon(Icons.apple),
      //     ),
      //     ListTile(
      //       title: Text("Guava"),
      //       leading: Icon(Icons.apple),
      //     ),
      //     ListTile(
      //       title: Text("Papaya"),
      //       leading: Icon(Icons.apple),
      //     ),
      //     ListTile(
      //       title: Text("Cucumber"),
      //       leading: Icon(Icons.apple),
      //     ),
      //     ListTile(
      //       title: Text("Raddish"),
      //       leading: Icon(Icons.apple),
      //     ),
      //   ],
      // ),
    );
  }
}
