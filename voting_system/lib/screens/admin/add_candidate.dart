// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// components
import 'package:voting_system/components/global/custom_button.dart';
import 'package:voting_system/components/global/custom_textfield.dart';
import 'package:voting_system/models/candidate.dart';
import 'package:voting_system/providers/user_provider.dart';

// utils
import 'package:voting_system/utils/constants.dart';

import '../../models/user.dart';
import '../../models/voting.dart';
import '../../providers/voting_provider.dart';

class CreateCandidatePage extends StatefulWidget {
  final Voting voting;
  const CreateCandidatePage({Key? key, required this.voting}) : super(key: key);

  @override
  State<CreateCandidatePage> createState() => _CreateCandidatePageState();
}

class _CreateCandidatePageState extends State<CreateCandidatePage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  String? handleValidation(String? value) {
    if (value == null || value.isEmpty || value.trim() == '') {
      return 'Required';
    }
    return null;
  }

  void handleCreate() async {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> toSend = {
        "name": titleController.text,
        "description": descController.text,
      };
// to json string
      String toJSONString = jsonEncode(toSend);
// sending to server
      print(toJSONString);
      User loggedInUser =
          Provider.of<UserProvider>(context, listen: false).user!;
      var response = await http.post(
        Uri.parse("$baseURL/votings/${widget.voting.id}/candidates"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer ${loggedInUser.token}",
        },
        body: toJSONString,
      );

      var decodedResponse = jsonDecode(response.body);

      if (decodedResponse['status'] == 'success') {
// // parsing to Candidate
        Candidate addedCandidate = Candidate.fromJson(decodedResponse['data']);
// // updating the provider
        Provider.of<VotingProvider>(context, listen: false)
            .addCandidate(addedCandidate);
//         // showing snackbar
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Candidate'),
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
                Text("Add New Candidate"),
                const SizedBox(
                  height: 20.0,
                ),
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
                CustomButton(
                    name: "Add Candidate", handleClicked: handleCreate),
                Divider(),
                Text("Candidates"),
                for (Candidate c in widget.voting.candidates)
                  ListTile(
                    title: Text(c.name),
                    subtitle: Text(c.description),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {},
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
