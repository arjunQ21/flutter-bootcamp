// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

// utils
import '/utils/constants.dart';

// screens
import '/screens/register_screen.dart';

// components
import '/components/custom_button.dart';
import '/components/custom_link_badge.dart';
import '/components/custom_textfield.dart';

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
  RegExp passwordRegX =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

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
    } else if (!passwordRegX.hasMatch(value)) {
      return 'Invalid Password';
    }
    return null;
  }

  void handleLogin() {
    if (_formkey.currentState!.validate()) {
      print(
          'email: ${_emailController.text}, password: ${_passwordController.text}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Welcome back, ${_emailController.text}',
          ),
          backgroundColor: Colors.green.shade300,
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
      clearData();
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
                            color: kLinkColor,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomLinkBadge(
                        imageUrl: 'assets/fb.png',
                        handleClick: () {
                          print('Facebook is clicked');
                        },
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      CustomLinkBadge(
                        imageUrl: 'assets/gg.png',
                        handleClick: () {
                          print('Goggle is clicked');
                        },
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      CustomLinkBadge(
                        imageUrl: 'assets/ld.png',
                        handleClick: () {
                          print('Linkedin is clicked');
                        },
                      ),
                    ],
                  ),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterScreen()),
                          );
                        },
                        child: const Text(
                          "Register now",
                          style: TextStyle(
                            color: kLinkColor,
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
