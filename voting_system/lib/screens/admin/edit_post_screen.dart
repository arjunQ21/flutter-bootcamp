import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// components
import 'package:voting_system/components/global/custom_button.dart';
import 'package:voting_system/components/global/custom_textfield.dart';
import 'package:voting_system/providers/user_provider.dart';
import 'package:voting_system/providers/voting_provider.dart';
import 'package:voting_system/screens/admin/manage_candidates.dart';

// utils
import 'package:voting_system/utils/constants.dart';

import '../../models/user.dart';
import '../../models/voting.dart';

class EditPostScreen extends StatefulWidget {
  final Voting voting;

  const EditPostScreen({Key? key, required this.voting}) : super(key: key);

  @override
  State<EditPostScreen> createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  late DateTime startDate = widget.voting.from;
  late DateTime endDate = widget.voting.to;
  late bool isCheckboxOn = widget.voting.status == 'shown';
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  String? handleValidation(String? value) {
    if (value == null || value.isEmpty || value.trim() == '') {
      return 'Required';
    }
    return null;
  }

  void handleUpdate() async {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> toSend = {
        "title": titleController.text,
        "description": descController.text,
        "from": startDateController.text,
        "to": endDateController.text,
        "status": isCheckboxOn ? "shown" : "hidden",
      };

// to json string
      String toJSONString = jsonEncode(toSend);

// sending to server
      print(toJSONString);

      User loggedInUser =
          Provider.of<UserProvider>(context, listen: false).user!;

      var response = await http.put(
        Uri.parse("$baseURL/votings/${widget.voting.id}"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer ${loggedInUser.token}",
        },
        body: toJSONString,
      );

      var decodedResponse = jsonDecode(response.body);

      if (decodedResponse['status'] == 'success') {
// parsing to voting
        Voting editedVoting = Voting.fromJson(decodedResponse['data']);
// updating the provider
        Provider.of<VotingProvider>(context, listen: false)
            .setVoting(editedVoting);
        // showing snackbar
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Edited Successfully"),
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
    titleController.text = widget.voting.title;
    descController.text = widget.voting.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Voting'),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Shown?"),
                    Checkbox(
                        value: isCheckboxOn,
                        onChanged: (val) {
                          if (val != null) {
                            setState(() {
                              isCheckboxOn = val;
                            });
                          }
                        }),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                CustomButton(name: "Update Post", handleClicked: handleUpdate),
                const SizedBox(
                  height: 30.0,
                ),
                CustomButton(
                  name: "Manage Candidates",
                  handleClicked: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ManageCandidatesPage(
                          voting: widget.voting,
                        ),
                      ),
                    );
                  },
                  bgColor: Colors.grey.withOpacity(0.3),
                  textColor: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
