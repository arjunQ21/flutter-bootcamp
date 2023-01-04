import "package:flutter/material.dart";

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FlutterLogo(),
                Container(
                  height: 40,
                  width: 40,
                  color: Colors.yellow,
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    "GCES",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: const Text(
                      "Arjun",
                      style: TextStyle(
                        fontSize: 30.0,
                        backgroundColor: Colors.greenAccent,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FlutterLogo(),
                Container(
                  height: 40,
                  width: 40,
                  color: Colors.yellow,
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    "GCES",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        appBar: AppBar(
          title: const Text("Flutter Bootcamp Day 1"),
        ),
      ),
    ),
  );
}
