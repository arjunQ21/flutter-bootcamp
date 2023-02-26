import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveToken(String token) async {
  var prefs = await SharedPreferences.getInstance();
  prefs.setString('accessToken', token);
  print("Token saved to device.");
}
