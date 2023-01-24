import 'package:flutter/material.dart';

class SwitchAndInputController extends StatefulWidget {
  void Function(Color) onColorChanged;
  void Function(String) onInputChanged;
  SwitchAndInputController({
    Key? key,
    required this.onColorChanged,
    required this.onInputChanged,
  }) : super(key: key);

  @override
  State<SwitchAndInputController> createState() =>
      _SwitchAndInputControllerState();
}

class _SwitchAndInputControllerState extends State<SwitchAndInputController> {
  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Switch(
            value: isToggled,
            onChanged: (v) {
              setState(() {
                isToggled = !isToggled;
              });
              if (v) {
                widget.onColorChanged(Colors.green);
              } else {
                widget.onColorChanged(Colors.red);
              }
            }),
        Expanded(
          child: TextField(
            onChanged: widget.onInputChanged,
          ),
        ),
      ],
    );
  }
}
