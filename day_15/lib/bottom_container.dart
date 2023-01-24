import 'package:day_15/app_configuration_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomContainer extends StatelessWidget {
  BottomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<AppConfigProvider>(
          builder: (context, providerVariable, child) {
        return Container(
          width: double.infinity,
          color: providerVariable.isSwitchToggled ? Colors.red : Colors.green,
          child: Center(
              child: Text(
            providerVariable.textToShow,
            style: TextStyle(
              fontSize: 56,
            ),
          )),
        );
      }),
    );
  }
}
