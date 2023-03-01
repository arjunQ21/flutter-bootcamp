// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// components
import 'package:voting_system/components/global/custom_button.dart';
import 'package:voting_system/components/global/custom_textfield.dart';
import 'package:voting_system/providers/user_provider.dart';

// utils
import 'package:voting_system/utils/constants.dart';

import '../../models/user.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final _formKey = GlobalKey<FormState>();

  

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  // endDate.minus
// endDate.to
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  String? handleValidation(String? value) {
    if (value == null || value.isEmpty || value.trim() == '') {
      return 'Required';
    }
    return null;
  }

  void handleCreate() async {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> toSend = {
        "title": titleController.text,
        "description": descController.text,
        "from": startDate.millisecondsSinceEpoch,
        "to": endDate.millisecondsSinceEpoch,
      };

// to json string
      String toJSONString = jsonEncode(toSend);

// sending to server
      print(toJSONString);

      User loggedInUser =
          Provider.of<UserProvider>(context, listen: false).user!;

      var response = await http.post(
        Uri.parse("$baseURL/votings"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer ${loggedInUser.token}",
        },
        body: toJSONString,
      );

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Created Successfully"),
      ));
      Navigator.of(context).pop();
    }
  }

  chooseStartTime() async {
    var pickDate = await showDatePicker(
      context: context,
      initialDate: startDate,
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (pickDate != null) {
      setState(() {
        startDate = pickDate;
        startDateController.text = dateFormatter.format(startDate);
      });
    }
  }

  chooseEndTime() async {
    DateTime? pickDate = await showDatePicker(
      context: context,
      initialDate: endDate,
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (pickDate != null) {
      setState(() {
        endDate = pickDate;
        endDateController.text = dateFormatter.format(endDate);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    startDateController.text = dateFormatter.format(startDate);
    endDateController.text = dateFormatter.format(endDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
        centerTitle: true,
        toolbarHeight: 65,
        backgroundColor: kPrimaryColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
                  label: "Title",
                  placeholder: "Enter title",
                  fieldController: titleController,
                  handleValidation: handleValidation,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CustomTextField(
                  label: "Description",
                  placeholder: "Enter description",
                  fieldController: descController,
                  handleValidation: handleValidation,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CustomTextField(
                  label: "Start Date",
                  fieldController: startDateController,
                  placeholder: "Choose start date",
                  handleValidation: handleValidation,
                  readOnly: true,
                  handleTap: chooseStartTime,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CustomTextField(
                  label: "End Date",
                  fieldController: endDateController,
                  placeholder: "Choose end date",
                  handleValidation: handleValidation,
                  readOnly: true,
                  handleTap: chooseEndTime,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                CustomButton(name: "Create Post", handleClicked: handleCreate)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
