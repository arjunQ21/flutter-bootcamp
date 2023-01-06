// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  EdgeInsets bodyPadding = EdgeInsets.symmetric(horizontal: 8);
  SizedBox heightBox = SizedBox(height: 8);

  SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE9E0F0),
      appBar: AppBar(
        backgroundColor: const Color(0xffE9E0F0),
        centerTitle: true,
        title: const Text(
          "Flutter BootCamp",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/scene.jpeg'),
          heightBox,
          Padding(
            padding: bodyPadding,
            child: const Text(
              "Settings",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            color: Colors.white,
            margin: bodyPadding,
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 24,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Icon(Icons.person),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Text(
                          "data sd fas  dsfkbas kbfk akkjbak kb wkfeaj s afuuash ufhaiwh fwae hkfwakwabehfkw",
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "100",
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
          heightBox,
          Container(
            color: Colors.white,
            margin: bodyPadding,
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 24,
            ),
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Icon(Icons.person),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("data"),
                      Text(
                        "lorem sda dsakjnksa fknwakf k sdfku as kuhawhf hweahifhewai hh",
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
