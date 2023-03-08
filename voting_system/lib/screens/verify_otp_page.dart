import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_system/components/global/custom_button.dart';
import 'package:voting_system/components/global/custom_textfield.dart';
import 'package:voting_system/models/candidate.dart';
import 'package:voting_system/providers/user_provider.dart';
import 'package:voting_system/providers/voted_candidates_provider.dart';
import 'package:voting_system/utils/constants.dart';

class VerifyOTPPage extends StatefulWidget {
  final Candidate candidate;
  const VerifyOTPPage({super.key, required this.candidate});

  @override
  State<VerifyOTPPage> createState() => _VerifyOTPPageState();
}

class _VerifyOTPPageState extends State<VerifyOTPPage> {
  bool _isSendingReq = false;
  TextEditingController _otpCodeController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, userProvider, child) {
      return Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Verify OTP"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Verify its you.",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '''
We have sent an email to: 
${userProvider.user!.email}.
      
Please enter the code below to confirm its you.''',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                fieldController: _otpCodeController,
                label: "OTP Code",
                placeholder: "OTP Code in email",
                handleValidation: (value) {
                  if (value == null) return "Required";
                  if (value.isEmpty) {
                    return "OTP Code is required";
                  }
                  if (value.length != 5) {
                    return "OTP Code must be 5 characters long";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                  name: _isSendingReq ? "..loading.." : "Confirm and Vote",
                  handleClicked: _isSendingReq
                      ? null
                      : () async {
                          try {
                            setState(() {
                              _isSendingReq = true;
                            });
                            if (_formKey.currentState!.validate()) {
                              String email = userProvider.user!.email;
                              String otpCode = _otpCodeController.text;

                              var toSend = {
                                'receiverAddress': email,
                                "code": otpCode,
                              };

                              print("Sending this to the server: $toSend");

                              var response = await http.post(
                                  Uri.parse("$baseURL/auth/otp/submit"),
                                  headers: {
                                    "Content-Type": "application/json",
                                  },
                                  body: jsonEncode(toSend));

                              var submissionResponseJSON =
                                  jsonDecode(response.body);

                              if (submissionResponseJSON['status'] ==
                                  'success') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "OTP Verified. Voting Now...")));

                                var obtainedOTPId =
                                    submissionResponseJSON['data']['otpId'];

                                if (obtainedOTPId == null) {
                                  throw Exception("OTP Id not obtained");
                                }

                                var votingResponse = await http.post(
                                  Uri.parse(
                                      "$baseURL/votings/${widget.candidate.votingId}/candidates/${widget.candidate.id}/vote"),
                                  headers: {'Content-Type': "application/json"},
                                  body: jsonEncode({
                                    "otpId": obtainedOTPId,
                                  }),
                                );

                                var votingResponseJSON =
                                    jsonDecode(votingResponse.body);

                                if (votingResponseJSON['status'] == 'success') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text("Voted Successfully")));
                                  await Provider.of<VotedCandidatesProvider>(
                                          context,
                                          listen: false)
                                      .fetchFromAPI();
                                  Navigator.pop(context);
                                } else {
                                  throw Exception("Voting Failed. " +
                                      (votingResponseJSON['message'] ??
                                              votingResponseJSON)
                                          .toString());
                                }
                              } else {
                                throw Exception("OTP Verification Failed. " +
                                    (submissionResponseJSON['message'] ??
                                            submissionResponseJSON)
                                        .toString());
                              }
                            } else {
                              throw Exception("Check inputs");
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Error: $e")));
                          } finally {
                            setState(() {
                              _isSendingReq = false;
                            });
                          }
                        }),
            ]),
          ),
        ),
      );
    });
  }
}
