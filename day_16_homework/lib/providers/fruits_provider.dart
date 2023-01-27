import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  FruitProvider() {
    init();
  }

  Future<void> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // print(prefs.getKeys().toList());

    // prefs.getKeys().toList().forEach((element) {
    //   print("Key: $element, value: " + (prefs.getString(element) ?? ""));
    // });

    String? savedFruits = prefs.getString("fruits");

    if (savedFruits != null) {
      var decodedFruits = jsonDecode(savedFruits) as List;

      fruits = decodedFruits.map((e) => e as Map<String, dynamic>).toList();
      notifyListeners();
    }
  }

  Future<void> saveToDevice() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String fruitsToString = jsonEncode(fruits);

    await prefs.setString("fruits", fruitsToString);
    print("Saved latest fruits to device");
  }

  void deleteFruit(String name) {
    int indexOfFruit = -1;

    for (int i = 0; i < fruits.length; i++) {
      if (name == fruits[i]['name']) {
        indexOfFruit = i;
        // break;
      }
    }

    if (indexOfFruit == -1) {
      // vetiyena
      print("Fruit vetiyena");
    } else {
      // vetiyo
      fruits.removeAt(indexOfFruit);
      notifyListeners();
    }
    saveToDevice();
  }

  void addFruit(String name, bool isFavorite, int quantity) {
    Map<String, dynamic> fruitToAdd = {
      "name": name,
      "isFavorite": isFavorite,
      "quantity": quantity,
    };

    fruits.add(fruitToAdd);

    notifyListeners();
    saveToDevice();
  }

  void increaseQuantity(String name) {
    for (int i = 0; i < fruits.length; i++) {
      if (name == fruits[i]['name']) {
        fruits[i]['quantity']++;
      }
    }
    notifyListeners();
    saveToDevice();
  }

  void toggleFavorite(String name) {
    print("Obtained fruit: " + name);
    for (int i = 0; i < fruits.length; i++) {
      if (name == fruits[i]['name']) {
        fruits[i]['isFavorite'] = !fruits[i]['isFavorite'];
      }
    }
    notifyListeners();
    saveToDevice();
  }
}
