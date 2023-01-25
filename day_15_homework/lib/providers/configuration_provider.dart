import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigurationProvider with ChangeNotifier {
  String text = "Hello";
  double fontSize = 120;
  Color backgroundColor = Colors.blue;

  ConfigurationProvider() {
    init();
  }

  Future<void> init() async {
    var instance = await SharedPreferences.getInstance();

    int savedColor = instance.getInt("colorValue") ?? Colors.blue.value;
    backgroundColor = Color(savedColor);

    fontSize = instance.getDouble("fontSize") ?? 120;
    text = instance.getString("text") ?? "Hello";

    notifyListeners();
  }

  Future<void> setText(String text) async {
    this.text = text;
    notifyListeners();
    var instance = await SharedPreferences.getInstance();
    instance.setString("text", text);
  }

  Future<void> setFontSize(double fontSize) async {
    this.fontSize = fontSize;
    notifyListeners();
    var instance = await SharedPreferences.getInstance();
    instance.setDouble("fontSize", fontSize);
  }

  Future<void> setColor(Color color) async {
    backgroundColor = color;
    notifyListeners();

    var instance = await SharedPreferences.getInstance();
    instance.setInt("colorValue", color.value);
  }
}
