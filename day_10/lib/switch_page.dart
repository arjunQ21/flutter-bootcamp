import 'package:flutter/material.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({super.key});

  @override
  State<SwitchPage> createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  // List<String> _colorOptions = ['red', 'green', 'blue'];
  List<Map<String, dynamic>> _colorOptions = [
    {
      "title": "red",
      "value": Colors.red,
    },
    {
      "title": "blue",
      "value": Colors.blue,
    },
    {
      "title": "green",
      "value": Colors.green,
    }
  ];
  // List<Color> _colorValues = [Colors.red, Colors.green, Colors.blue];

  late Color _selectedColor = _colorOptions[0]['value'];
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _messageEditingController = TextEditingController();

  bool isSwitchOn = false;

  bool isCheckboxOn = false;

  String textToShow = "hello";

  // Color bgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isCheckboxOn
          ? AppBar(
              backgroundColor: _selectedColor,
              title: const Text("Stateful Widgets"),
              actions: [
                IconButton(
                    onPressed: () {
                      _messageEditingController.text = "reset";
                    },
                    icon: Icon(Icons.reset_tv))
              ],
            )
          : null,
      backgroundColor: isSwitchOn ? Colors.red : Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textToShow,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber[400]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Show Red BG: "),
                  Switch.adaptive(
                      value: isSwitchOn,
                      onChanged: (v) {
                        print("Switch Changed to: $v");
                        setState(() {
                          isSwitchOn = v;
                          // if (v) {
                          //   bgColor = Colors.red;
                          // } else {
                          //   bgColor = Colors.white;
                          // }
                          // bgColor = v ? Colors.red : Colors.white;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Show Appbar: "),
                  Checkbox(
                      value: isCheckboxOn,
                      onChanged: (v) {
                        setState(() {
                          isCheckboxOn = v!;
                        });
                      }),
                ],
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.always,
                validator: (value) {
                  if (value == null) {
                    return "Enter something";
                  }

                  if (value.length == 0) return "NOthing entered";
                  return null;
                },
                controller: _messageEditingController,
              ),
              ElevatedButton(
                onPressed: () {
                  // _messageEditingController.text = "Value rakhna milxa";
                  setState(() {
                    textToShow = _messageEditingController.text;
                  });

                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("All Good")));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Check your input again.")));
                  }
                },
                child: Text("Confirm"),
              ),
              DropdownButton(
                value: _selectedColor,
                items: _colorOptions
                    .map((e) => DropdownMenuItem(
                        value: e['value'], child: Text(e['title'])))
                    .toList(),
                onChanged: (changedValue) {
                  setState(() {
                    _selectedColor = changedValue as Color;
                  });
                },
              ),
            ],
          )),
        ),
      ),
    );
  }

  Color stringToColor(String color) {
    switch (color) {
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;
      default:
        return Colors.amber;
    }
  }
}
