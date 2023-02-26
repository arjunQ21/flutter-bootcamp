import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voting_system/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkSavedData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoActivityIndicator(),
              SizedBox(height: 20.0),
              Text(
                'Loading...',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Map?> checkSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedToken = prefs.getString('accessToken');

    if (savedToken == null) {
      return null;
    } else {
      var response = await http.get(Uri.parse("$baseURL/users/me"), headers: {
        'Content-Type': 'application/json',
        'Authorization': "Bearer $savedToken"
      });

      if (response.statusCode == 200) {
        var jsonDecoded = jsonDecode(response.body);
        print(jsonDecoded);
      } else {
        return null;
      }
    }
  }
}
