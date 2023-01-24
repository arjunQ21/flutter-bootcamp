import 'package:day_15/app_configuration_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SwitchAndInputController extends StatelessWidget {
  SwitchAndInputController({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppConfigProvider>(
        builder: (context, appConfigProviderVariable, child) {
      return Row(
        children: [
          Switch(
              value: appConfigProviderVariable.isSwitchToggled,
              onChanged: (v) {
                appConfigProviderVariable.toggleSwitch();
              }),
          Expanded(
            child: TextField(onChanged: (v) {
              appConfigProviderVariable.updateText(v);
            }),
          ),
        ],
      );
    });
  }
}
