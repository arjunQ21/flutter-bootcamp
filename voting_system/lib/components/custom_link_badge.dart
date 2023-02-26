// ignore_for_file: must_be_immutable

import '/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomLinkBadge extends StatelessWidget {
  String imageUrl;
  void Function() handleClick;

  CustomLinkBadge({
    Key? key,
    required this.imageUrl,
    required this.handleClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: handleClick,
      child: Container(
        width: 50.0,
        height: 50.0,
        padding: const EdgeInsets.all(7.5),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                5.0,
              ),
            ),
            color: kLightColor,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 1),
                color: kIconColor,
                blurRadius: 1.0,
                spreadRadius: 0.0,
              )
            ]),
        child: Image(
          image: AssetImage(
            imageUrl,
          ),
        ),
      ),
    );
  }
}
