import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

Map<String, String> dog1 = {
  "name": "Vusuwa Kukur",
  "color": "black",
};

Map<String, String> dog2 = {
  "name": "Vusuwa Kukur2",
  "color": "white",
};

Map<String, String> dog3 = {
  "name": "Vusuwa Kukur3",
  "color": "red",
};

List<Map<String, dynamic>> dogs = [
  {
    "name": "Vusuwa Kukur",
    "color": "black",
    "textColor": Colors.black,
  },
  {
    "name": "Vusuwa Kukur2",
    "color": "white",
    "textColor": Colors.green,
  },
  {
    "name": "Set Kukur",
    "color": "white",
    "textColor": Colors.red,
  }
];

class Dogs extends StatelessWidget {
  const Dogs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dogs"),
        ),
        body: Center(
          child: Column(
            children: [
              // using for-in loop
              // for (var dog in dogs)
              //   ListTile(
              //     leading: Icon(Icons.abc),
              //     title: Text(
              //       dog["name"]!,
              //       style: TextStyle(
              //         fontSize: 19,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     subtitle: Text(
              //       dog["color"]!,
              //       style: TextStyle(
              //         fontSize: 19,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ),

              // using good old for loop
              for (int i = 0; i < dogs.length; i++)
                ListTile(
                  leading: Icon(Icons.abc),
                  title: Text(
                    dogs[i]["name"]!,
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: dogs[i]["textColor"],
                    ),
                  ),
                  subtitle: Text(
                    dogs[i]["color"]!,
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ));
  }
}


