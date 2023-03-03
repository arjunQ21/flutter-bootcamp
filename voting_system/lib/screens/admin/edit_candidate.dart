// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_system/screens/admin/set_candidate_image.dart';

import '../../components/global/candidate_image.dart';
import '../../components/global/custom_button.dart';
import '../../components/global/custom_textfield.dart';
import '../../models/user.dart';
import '../../models/candidate.dart';
import '../../providers/user_provider.dart';
import '../../providers/voting_provider.dart';
import '../../utils/constants.dart';

class EditCandidatePage extends StatefulWidget {
  final Candidate candidate;
  const EditCandidatePage({Key? key, required this.candidate})
      : super(key: key);

  @override
  State<EditCandidatePage> createState() => _EditCandidatePageState();
}

class _EditCandidatePageState extends State<EditCandidatePage> {
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
      var response = await http.put(
        Uri.parse(
            "$baseURL/votings/${widget.candidate.votingId}/candidates/${widget.candidate.id}"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer ${loggedInUser.token}",
        },
        body: toJSONString,
      );

      var decodedResponse = jsonDecode(response.body);

      if (decodedResponse['status'] == 'success') {
// // parsing to Candidate
        Candidate editedCandidate = Candidate.fromJson(decodedResponse['data']);
// // updating the provider
        Provider.of<VotingProvider>(context, listen: false)
            .editCandidate(editedCandidate);
//         // showing snackbar
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

  @override
  void initState() {
    super.initState();
    titleController.text = widget.candidate.name;
    descController.text = widget.candidate.description;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VotingProvider>(builder: (context, votingProvider, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Candidate'),
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
                  CustomButton(
                      name: "Edit Candidate Details",
                      handleClicked: handleCreate),
                  const SizedBox(
                    height: 20.0,
                  ),
                  if (widget.candidate.image != null)
                    CandidateImage(candidate: widget.candidate),
                  CustomButton(
                    name: "Update Image",
                    handleClicked: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              SetCandidateImage(candidate: widget.candidate),
                        ),
                      );
                    },
                    bgColor: Colors.grey.withOpacity(0.4),
                    textColor: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
