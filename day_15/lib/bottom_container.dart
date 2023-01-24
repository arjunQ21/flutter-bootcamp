import 'package:day_15/app_configuration_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomContainer extends StatefulWidget {
  BottomContainer({
    super.key,
  });

  @override
  State<BottomContainer> createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer> {
  int count = 0;

  // void initState() {
  //   super.initState();
  //   incrementCount();
  // }

  Future<void> incrementCount() async {
    print("incrementing");
    await Future.delayed(Duration(milliseconds: 100));
    setState(() {
      count = count + 0xff0000ff;
    });
    incrementCount();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<AppConfigProvider>(
          builder: (context, providerVariable, child) {
        return Container(
          width: double.infinity,
          // color: providerVariable.isSwitchToggled ? Colors.red : Colors.green,
          color: Color(count),
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
