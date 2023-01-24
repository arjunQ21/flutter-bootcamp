import 'package:flutter/material.dart';

class AppConfigProvider with ChangeNotifier {
  bool isSwitchToggled = false;

  String textToShow = "Type something in above input field";

// creating constructor
  AppConfigProvider() {
    // changeAutomatically();
  }

  Future<void> changeAutomatically() async {
    await Future.delayed(Duration(seconds: 1));
    // isSwitchToggled = !isSwitchToggled;
    // notifyListeners();
    toggleSwitch();
    updateText(textToShow + "!");
    changeAutomatically();
  }

  void toggleSwitch() {
    isSwitchToggled = !isSwitchToggled;
    notifyListeners();
    print("Toggling switch to: " + isSwitchToggled.toString());
  }

  void updateText(String text) {
    textToShow = text;
    notifyListeners();
    print("Input value in provider: " + textToShow);
  }
}
