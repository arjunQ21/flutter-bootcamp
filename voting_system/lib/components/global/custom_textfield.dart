// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

// utils
import '/utils/constants.dart';

class CustomTextField extends StatefulWidget {
  String label;
  String placeholder;
  TextInputType inputType;
  TextEditingController? fieldController;
  String? Function(String?) handleValidation;
  IconData? prefixIcon;
  String? initialValue;
  IconData? suffixIcon;
  bool isPassword;
  void Function()? handleTap;
  bool readOnly;

  CustomTextField({
    Key? key,
    required this.label,
    required this.placeholder,
    this.inputType = TextInputType.text,
    this.fieldController,
    required this.handleValidation,
    this.initialValue,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.handleTap,
    this.readOnly = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: kIconColor,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        TextFormField(
          initialValue: widget.initialValue,
          readOnly: widget.readOnly,
          controller: widget.fieldController,
          validator: widget.handleValidation,
          obscureText: widget.isPassword ? !isPasswordVisible : false,
          onTap: widget.handleTap,
          decoration: InputDecoration(
            hintText: widget.placeholder,
            prefixIcon: widget.prefixIcon != null
                ? Icon(
                    widget.prefixIcon,
                    color: kIconColor,
                  )
                : null,
            suffixIcon: widget.isPassword
                ? IconButton(
                    color: kIconColor,
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    icon: isPasswordVisible
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  )
                : null,
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1.0,
                color: kIconColor,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1.0,
                color: kIconColor,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          keyboardType: widget.inputType,
        ),
      ],
    );
  }
}
