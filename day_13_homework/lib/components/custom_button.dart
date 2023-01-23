// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// utils
import 'package:day_10_homework/utils/constants.dart';

class CustomButton extends StatelessWidget {
  String name;
  bool isLoading;
  void Function()? handleClicked;

  CustomButton(
      {Key? key,
      required this.name,
      this.handleClicked,
      required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (isLoading) ? null : handleClicked,
      style: ButtonStyle(
        elevation: MaterialStateProperty.resolveWith((states) => 0.0),
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => kButtonColor,
        ),
        minimumSize: MaterialStateProperty.resolveWith(
          (states) => const Size(
            double.maxFinite,
            55.0,
          ),
        ),
      ),
      child: (isLoading)
          ? CupertinoActivityIndicator(
              radius: 14,
              color: Colors.white,
            )
          : Text(
              name,
              style: const TextStyle(
                color: kLightColor,
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
    );
  }
}
