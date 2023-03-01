// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// utils
import 'package:voting_system/utils/constants.dart';

// screens
import 'package:voting_system/screens/home_screen.dart';
import 'package:voting_system/screens/auth/login_screen.dart';

import '../models/user.dart';
import '../providers/user_provider.dart';

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
            children: const [
              CupertinoActivityIndicator(),
              SizedBox(height: 20.0),
              Text(
                'Loading',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedToken = prefs.getString('accessToken');

    if (savedToken == null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    } else {
      var response = await http.get(Uri.parse("$baseURL/users/me"), headers: {
        'Content-Type': 'application/json',
        'Authorization': "Bearer $savedToken"
      });

      var jsonDecoded = jsonDecode(response.body);
      if (jsonDecoded['status'] == 'success') {
        print("Login found from last saved data");

        // Parsing the user data from the response
        Map<String, dynamic> obtainedUser = jsonDecoded['data']['user'];
        // adding 'token' to fit user Model
        obtainedUser['token'] = savedToken;
        // changing to user model
        User userFromResponse = User.fromJson(obtainedUser);
        // print(jsonDecoded['data']['user']);

        // put obtained user in provider
        Provider.of<UserProvider>(context, listen: false)
            .setUser(userFromResponse);

// naviagate to home page
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomeScreen(
              isAdmin: userFromResponse.role == 'admin',
            ),
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    }
  }
}
