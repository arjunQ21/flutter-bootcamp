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
import '../../models/voting.dart';
import '../../providers/voting_provider.dart';

class CreateCandidatePage extends StatefulWidget {
  const CreateCandidatePage({Key? key}) : super(key: key);

  @override
  State<CreateCandidatePage> createState() => _CreateCandidatePageState();
}

class _CreateCandidatePageState extends State<CreateCandidatePage> {
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

      var decodedResponse = jsonDecode(response.body);

      if (decodedResponse['status'] == 'success') {
// parsing to voting
        Voting addedVoting = Voting.fromJson(decodedResponse['data']);
// updating the provider
        Provider.of<VotingProvider>(context, listen: false)
            .setVoting(addedVoting);
        // showing snackbar
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Added Successfully"),
        ));
        Navigator.of(context).pop();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Something went wrong: " +
              (decodedResponse['data'] ?? "").toString()),
        ));
      }
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
        title: const Text('Add Candidate'),
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
                  label: "Name",
                  placeholder: "Enter Name",
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
                CustomButton(name: "Add Candidate", handleClicked: handleCreate)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
