import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({super.key});

  @override
  State<SwitchPage> createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  List<String> _colorOptions = ['red', 'green', 'blue'];

  late String _selectedColor = _colorOptions[0];
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _messageEditingController = TextEditingController();

  bool isSwitchOn = false;

  bool isCheckboxOn = false;

  String textToShow = "";

  // Color bgColor = Colors.white;

  @override
  void initState() {
    super.initState();
    readSavedData();
  }

  Future<void> readSavedData() async {
    final prefs = await SharedPreferences.getInstance();

    bool savedRedBGColorValue = prefs.getBool("redBgColor") ?? false;
    bool checkBoxIsONValue = prefs.getBool("checkBoxIsOn") ?? false;

    print("Saved value: " + savedRedBGColorValue.toString());

    setState(() {
      isSwitchOn = savedRedBGColorValue;
      isCheckboxOn = checkBoxIsONValue;
      _selectedColor = prefs.getString("selectedColor") ?? "red";
      textToShow = prefs.getString("inputString") ?? "hello";
    });
    _messageEditingController.text = prefs.getString("inputString") ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isCheckboxOn
          ? AppBar(
              backgroundColor: stringToColor(_selectedColor),
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
                      onChanged: (v) async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                        await prefs.setBool("redBgColor", v);

                        // bool savedValue = await prefs.getBool("redBgColor")!;

                        // print("Saved value while changing: " +
                        // (savedValue).toString());

                        // print("Switch Changed to: $v");
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
                      onChanged: (v) async {
                        setState(() {
                          isCheckboxOn = v!;
                        });

                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                        await prefs.setBool("checkBoxIsOn", isCheckboxOn);
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
                onPressed: () async {
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
                  var prefs = await SharedPreferences.getInstance();
                  prefs.setString("inputString", textToShow);
                },
                child: Text("Confirm"),
              ),
              DropdownButton(
                value: _selectedColor,
                items: _colorOptions
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (changedValue) async {
                  setState(() {
                    _selectedColor = changedValue.toString();
                  });

                  var prefs = await SharedPreferences.getInstance();
                  await prefs.setString("selectedColor", _selectedColor);
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
