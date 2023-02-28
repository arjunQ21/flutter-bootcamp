// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

// utils
import '/utils/constants.dart';

// screens
import 'login_screen.dart';

// components
import '../../components/global/custom_button.dart';
import '../../components/global/custom_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _selectedGender;

  RegExp emailRegX = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  RegExp passwordRegX =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');

  // handlers
  String? firstNameValidation(String? value) {
    if (value == null || value.isEmpty || value.trim() == '') {
      return 'First Name is required';
    }
    return null;
  }

  String? lastNameValidation(String? value) {
    if (value == null || value.isEmpty || value.trim() == '') {
      return 'Last Name is required';
    }
    return null;
  }

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

  String? genderValidation(String? value) {
    if (value == null || value.isEmpty || value.trim() == '') {
      return 'Gender is required';
    }
    return null;
  }

  void handleRegister() {
    if (_formkey.currentState!.validate()) {
      print(
          'firstName: ${_firstNameController.text}, lastName: ${_lastNameController.text}, email: ${_emailController.text}, password: ${_passwordController.text}, gender: $_selectedGender');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Register Successfull',
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
    _firstNameController.clear();
    _lastNameController.clear();
    _emailController.clear();
    _passwordController.clear();
    setState(() {
      _selectedGender = null;
    });
  }

  List<DropdownMenuItem<String>> genders = const [
    DropdownMenuItem(
      value: "male",
      child: Text("Male"),
    ),
    DropdownMenuItem(
      value: "female",
      child: Text("Female"),
    ),
    DropdownMenuItem(
      value: "other",
      child: Text("Other"),
    ),
  ];

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50.0,
                  ),
                  const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    label: 'First Name',
                    placeholder: 'Your First Name',
                    fieldController: _firstNameController,
                    handleValidation: firstNameValidation,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    label: 'Last Name',
                    placeholder: 'Your Last Name',
                    fieldController: _lastNameController,
                    handleValidation: lastNameValidation,
                  ),
                  const SizedBox(
                    height: 15,
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
                  const Text(
                    'Gender',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: kIconColor,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  DropdownButtonFormField(
                    value: _selectedGender,
                    items: genders,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedGender = value!;
                      });
                    },
                    validator: genderValidation,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 7.5,
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: kIconColor, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: kIconColor, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintText: 'Your Gender',
                      prefixIcon: const Icon(
                        Icons.person_search_outlined,
                        color: kIconColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  RichText(
                    text: const TextSpan(
                      text: 'By signing up, you agree to our ',
                      style: TextStyle(
                        color: kIconColor,
                      ),
                      children: [
                        TextSpan(
                          text: 'Terms & Conditions ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: '& '),
                        TextSpan(
                          text: 'Privacy Policy.*',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  CustomButton(
                    name: 'Register',
                    handleClicked: handleRegister,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: kIconColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
                        },
                        child: const Text(
                          "Login now",
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
