// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

// utils
import '/utils/constants.dart';

class CustomButton extends StatelessWidget {
  String name;
  void Function()? handleClicked;
  Color bgColor;
  Color textColor;

  CustomButton({
    Key? key,
    required this.name,
     this.handleClicked,
    this.bgColor = kPrimaryColor,
    this.textColor = kLightColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: handleClicked,
      style: ButtonStyle(
        elevation: MaterialStateProperty.resolveWith((states) => 0.0),
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => bgColor,
        ),
        minimumSize: MaterialStateProperty.resolveWith(
          (states) => const Size(
            double.maxFinite,
            55.0,
          ),
        ),
      ),
      child: Text(
        name,
        style: TextStyle(
          color: textColor,
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
