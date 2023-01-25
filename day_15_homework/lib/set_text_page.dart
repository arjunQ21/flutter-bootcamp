import 'package:day_15_homework/providers/configuration_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SetTextPage extends StatelessWidget {
  SetTextPage({super.key});

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
                            provider.setText(controller.text);
                            Navigator.of(context).pop();
                          },
                          child: Text("Set Text"))),
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
