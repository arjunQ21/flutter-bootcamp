// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

// screens
import 'package:voting_system/screens/home_screen.dart';

// utils
import 'package:voting_system/utils/constants.dart';
import '../../models/user.dart';
import '../../providers/user_provider.dart';
import '../../utils/functions.dart';

// screens
import 'register_screen.dart';

// components
import '../../components/global/custom_button.dart';
import '../../components/auth/custom_link_badge.dart';
import '../../components/global/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isRemembered = false;

  RegExp emailRegX = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  // handlers
  String? emailValidation(String? value) {
    if (value == null || value.isEmpty || value.trim() == '') {
      return 'Email is required';
    } else if (!emailRegX.hasMatch(value)) {
      return 'Invalid Email';
    }
    return null;
  }

  String? passwordValidation(String? value) {
    if (value == null || value.isEmpty || value.trim() == '') {
      return 'Password is required';
    }
    //  else if (!passwordRegX.hasMatch(value)) {
    //   return 'Invalid Password';
    // }
    return null;
  }

  void handleLogin() async {
    if (_formkey.currentState!.validate()) {
      Map toSend = {
        'email': _emailController.text,
        'password': _passwordController.text,
      };
      String jsonString = jsonEncode(toSend);
      var response = await http.post(
        Uri.parse("$baseURL/auth/login"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonString,
      );
      var jsonDecoded = jsonDecode(response.body);
      if (jsonDecoded['status'] == 'success') {
        // save token
        String obtainedToken = jsonDecoded['data']['tokens']['access']['token'];
        saveToken(obtainedToken);

        // Parsing the user data from the response
        Map<String, dynamic> obtainedUser = jsonDecoded['data']['user'];
        // adding 'token' to fit user Model
        obtainedUser['token'] = obtainedToken;
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Logged In "),
            backgroundColor: Colors.red.shade300,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(
              milliseconds: 2500,
            ),
            action: SnackBarAction(
              label: 'Dismiss',
              disabledTextColor: kLightColor,
              textColor: kLightColor,
              onPressed: () {
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
              },
            ),
          ),
        );
      } else {
        if (jsonDecoded.containsKey('message')) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(jsonDecoded['message']),
              backgroundColor: Colors.red.shade300,
              behavior: SnackBarBehavior.floating,
              duration: const Duration(
                milliseconds: 2500,
              ),
              action: SnackBarAction(
                label: 'Dismiss',
                disabledTextColor: kLightColor,
                textColor: kLightColor,
                onPressed: () {
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                },
              ),
            ),
          );
        }
      }
    }
  }

  void clearData() {
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50.0,
                  ),
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    label: 'Email',
                    placeholder: 'Your Email',
                    inputType: TextInputType.emailAddress,
                    fieldController: _emailController,
                    handleValidation: emailValidation,
                    prefixIcon: Icons.email_outlined,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    label: 'Password',
                    placeholder: 'Your Password',
                    inputType: TextInputType.emailAddress,
                    fieldController: _passwordController,
                    handleValidation: passwordValidation,
                    prefixIcon: Icons.lock_outline,
                    isPassword: true,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: isRemembered,
                            onChanged: (value) {
                              setState(() {
                                isRemembered = value!;
                              });
                            },
                          ),
                          const Text(
                            'Remember me',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          print('Forgot Password is clicked');
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: kPrimaryColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButton(
                    name: 'Login',
                    handleClicked: handleLogin,
                  ),
                  const SizedBox(
                    height: 45.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 75,
                        child: Divider(
                          height: 1.0,
                          thickness: 1.0,
                          color: kIconColor,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'or Continue with',
                        style: TextStyle(
                          color: kIconColor,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      SizedBox(
                        width: 75,
                        child: Divider(
                          height: 1.0,
                          thickness: 1.0,
                          color: kIconColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     CustomLinkBadge(
                  //       imageUrl: 'assets/fb.png',
                  //       handleClick: () {
                  //         print('Facebook is clicked');
                  //       },
                  //     ),
                  //     const SizedBox(
                  //       width: 15.0,
                  //     ),
                  //     CustomLinkBadge(
                  //       imageUrl: 'assets/gg.png',
                  //       handleClick: () {
                  //         print('Goggle is clicked');
                  //       },
                  //     ),
                  //     const SizedBox(
                  //       width: 15.0,
                  //     ),
                  //     CustomLinkBadge(
                  //       imageUrl: 'assets/ld.png',
                  //       handleClick: () {
                  //         print('Linkedin is clicked');
                  //       },
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: kIconColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterScreen()),
                          );
                        },
                        child: const Text(
                          "Register now",
                          style: TextStyle(
                            color: kPrimaryColor,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
