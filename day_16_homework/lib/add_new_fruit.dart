import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/fruits_provider.dart';

List<String> isFavOptions = ["Yes", "No"];

class AddNewFruit extends StatefulWidget {
  const AddNewFruit({super.key});

  @override
  State<AddNewFruit> createState() => _AddNewFruitState();
}

class _AddNewFruitState extends State<AddNewFruit> {
  String selectedIsFavOption = isFavOptions[0];

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();

  TextEditingController _quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add New Fruit"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Enter Fruit Name"),
              TextFormField(
                  controller: _nameController,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter some name";
                    }

                    if (value.trim().length < 5) {
                      return "Enter some name with more than 5 characters";
                    }
                  }),
              SizedBox(
                height: 50,
              ),
              Text("Enter Fruit Quantity"),
              TextFormField(
                  controller: _quantityController,
                  // autovalidateMode: AutovalidateMode.always,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a quantity";
                    }

                    try {
                      int.parse(value);
                    } catch (e) {
                      return "Please enter a valid integer.";
                    }
                  }),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("IS Favorite?"),
                  DropdownButton(
                    value: selectedIsFavOption,
                    items: isFavOptions
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedIsFavOption = value.toString();
                      });
                    },
                  ),
                ],
              ),
            ]),
          ),
        ),
        bottomNavigationBar: Container(
          height: 100,
          width: double.infinity,
          color: Colors.red,
          child: ElevatedButton(
            child: Text("Add Fruit"),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                var fruitProvider =
                    Provider.of<FruitProvider>(context, listen: false);

                var isFavorite = false;

                if (selectedIsFavOption == "Yes") {
                  isFavorite = true;
                }

                fruitProvider.addFruit(_nameController.text.trim(), isFavorite,
                    int.parse(_quantityController.text));

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Fruit Added Successfully."),
                  ),
                );

                Navigator.of(context).pop();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Please Check input validation."),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
