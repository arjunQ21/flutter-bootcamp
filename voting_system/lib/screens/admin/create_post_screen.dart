// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  final DateFormat dateFormatter = DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY);

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

  void handleCreate() {
    if (_formKey.currentState!.validate()) {
      print('Create Post');
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
