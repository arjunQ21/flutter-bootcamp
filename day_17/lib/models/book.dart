// {
//   'name': "The Hobbit",
//   'author': "J.R.R. Tolkien",
//   'color': Colors.red,
//   'soldOut': false,
// },

import 'package:flutter/material.dart';

class Book {
  String name;
  String author;
  Color color;
  bool soldOut;

// cosntructor
  Book({
    required this.name,
    required this.author,
    required this.color,
    required this.soldOut,
  });

// map to book
  static Book fromMap(Map<String, dynamic> rawBook) {
    return Book(
      name: rawBook['name'],
      author: rawBook['author'],
      color: rawBook['color'],
      soldOut: rawBook['soldOut'],
    );
  }

//methods
  void toggleSoldOut() {
    soldOut = !soldOut;
  }

  void toggleColor() {
    // color = color == Colors.red
    //     ? Colors.blue
    //     : color == Colors.blue
    //         ? Colors.green
    //         : Colors.red;

// using maps
    Map<Color, Color> changeColorMap = {
      Colors.red: Colors.blue,
      Colors.blue: Colors.green,
      Colors.green: Colors.red,
    };

    if (changeColorMap.containsKey(color)) {
      color = changeColorMap[color]!;
    } else {
      color = Colors.red;
    }
  }
}
