// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

// components
import 'package:voting_system/components/global/custom_button.dart';
import 'package:voting_system/components/global/custom_textfield.dart';

// utils
import 'package:voting_system/utils/constants.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  String? handleValidation(String? value) {
    if (value == null || value.isEmpty || value.trim() == '') {
      return 'Required';
    }
    return null;
  }

  void handleCreate() {
    if (_formKey.currentState!.validate()) {
      print('Create Post');
    }
  }

  chooseStartTime() async {
    DateTime? pickDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    setState(() {
      startDateController.text = pickDate.toString();
    });
  }

  chooseEndTime() async {
    DateTime? pickDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    setState(() {
      endDateController.text = pickDate.toString();
    });
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
                  placeholder: "Choose start date",
                  fieldController: startDateController,
                  handleValidation: handleValidation,
                  readOnly: true,
                  handleTap: chooseStartTime,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CustomTextField(
                  label: "End Date",
                  placeholder: "Choose end date",
                  fieldController: endDateController,
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
