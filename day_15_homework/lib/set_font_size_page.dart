import 'package:day_15_homework/providers/configuration_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SetFontSize extends StatelessWidget {
  SetFontSize({super.key});

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: controller,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]'))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            var provider = Provider.of<ConfigurationProvider>(
                                context,
                                listen: false);
                            provider.setFontSize(double.parse(
                                controller.text == ""
                                    ? "12"
                                    : controller.text));
                            Navigator.of(context).pop();
                          },
                          child: Text("Set Font Size"))),
                  TextButton(onPressed: () {}, child: Text("Cancel")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
