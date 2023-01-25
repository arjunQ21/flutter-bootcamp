import 'package:flutter/material.dart';

class FruitProvider with ChangeNotifier {
  List<Map<String, dynamic>> fruits = [
    {
      "name": "Apple",
      "isFavorite": false,
      "quantity": 4,
    },
    {
      "name": "Banana",
      "isFavorite": true,
      "quantity": 4,
    },
    {
      "name": "Papaya",
      "isFavorite": true,
      "quantity": 4,
    },
    {
      "name": "Mango",
      "isFavorite": false,
      "quantity": 4,
    },
    {
      "name": "Orange",
      "isFavorite": false,
      "quantity": 4,
    },
    {
      "name": "Orange",
      "isFavorite": false,
      "quantity": 4,
    },
  ];

  void increaseQuantity(String name) {
    for (int i = 0; i < fruits.length; i++) {
      if (name == fruits[i]['name']) {
        fruits[i]['quantity']++;
      }
    }
    notifyListeners();
  }

  void toggleFavorite(String name) {
    print("Obtained fruit: " + name);
    for (int i = 0; i < fruits.length; i++) {
      if (name == fruits[i]['name']) {
        fruits[i]['isFavorite'] = !fruits[i]['isFavorite'];
      }
    }
    notifyListeners();
  }
}
