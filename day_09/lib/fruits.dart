import 'package:day_09/single_fruit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

List<String> fruits = [
  "Apple",
  "Mango",
  "Banana",
  "Orange",
  "Pineapple",
  "Grapes",
  "Watermelon"
];

class FruitsPage extends StatelessWidget {
  const FruitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Fruits"),
      ),
      body: ListView.builder(
        itemCount: fruits.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(fruits[index]),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SingleFruitPage(
                    fruitName: fruits[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
