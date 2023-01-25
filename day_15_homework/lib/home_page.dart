import 'package:day_15_homework/choose_bg_color_page.dart';
import 'package:day_15_homework/providers/configuration_provider.dart';
import 'package:day_15_homework/set_font_size_page.dart';
import 'package:day_15_homework/set_text_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ConfigurationProvider>(builder: (context, configs, child) {
        return SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: configs.backgroundColor,
                  child: Center(
                    child: Text(
                      configs.text,
                      style: TextStyle(fontSize: configs.fontSize),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (c) => SetTextPage()));
                  },
                  child: Text("Set Text")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (c) => SetBGColorPage()));
                  },
                  child: Text("Set BG Color")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (c) => SetFontSize()));
                  },
                  child: Text("Set Font Size")),
            ],
          ),
        );
      }),
    );
  }
}
