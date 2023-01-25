import 'package:day_15_homework/providers/configuration_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SetBGColorPage extends StatelessWidget {
  SetBGColorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Consumer<ConfigurationProvider>(builder: (context, provider, child) {
        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Use Red Color"),
                    Switch(
                        value: provider.backgroundColor == Colors.red,
                        onChanged: ((value) {
                          provider.setColor(
                            provider.backgroundColor == Colors.red
                                ? Colors.blue
                                : Colors.red,
                          );
                        })),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Set Font Size"))),
                    TextButton(onPressed: () {}, child: Text("Cancel")),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
