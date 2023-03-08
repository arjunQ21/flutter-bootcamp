import 'package:flutter/material.dart';
import 'package:jsend/jsend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voting_system/models/user.dart';
import 'package:voting_system/screens/auth/login_screen.dart';

class UserProvider with ChangeNotifier {
  User? user;

  bool isLoggedIn() {
    return user != null;
  }

  void setUser(User user) {
    this.user = user;
    APIRequest.addDefaultHeaders({'Authorization': 'Bearer ${user.token}'});
    notifyListeners();
  }

  void logout(BuildContext context) async {
    user = null;
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove('accessToken');
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false);
  }
}
