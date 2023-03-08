import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_system/components/global/candidate_image.dart';
import 'package:voting_system/models/candidate.dart';
import 'package:voting_system/providers/user_provider.dart';
import 'package:voting_system/providers/voted_candidates_provider.dart';
import 'package:voting_system/screens/verify_otp_page.dart';
import 'package:voting_system/utils/constants.dart';

import '../../models/voting.dart';

class SingleVotingPage extends StatelessWidget {
  final Voting voting;
  const SingleVotingPage({super.key, required this.voting});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voting Details'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    voting.title,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Icon(
                    Icons.circle,
                    color:
                        voting.status == 'hidden' ? Colors.red : Colors.green,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                voting.description,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            if (voting.candidates.isEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("No Candidates here. Tata."),
              )
            else
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Candidates:",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            for (var candidate in voting.candidates)
              VotingCandidateCard(candidate: candidate),
          ],
        ),
      ),
    );
  }
}

class VotingCandidateCard extends StatefulWidget {
  const VotingCandidateCard({
    Key? key,
    required this.candidate,
  }) : super(key: key);

  final Candidate candidate;

  @override
  State<VotingCandidateCard> createState() => _VotingCandidateCardState();
}

class _VotingCandidateCardState extends State<VotingCandidateCard> {
  bool isSendingAPIRequest = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<VotedCandidatesProvider>(
        builder: (context, votedCandidatesProv, child) {
      bool thisCandidateIsVoted() =>
          votedCandidatesProv.isVotedCandidate(widget.candidate.id);

      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8.0),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: thisCandidateIsVoted()
              ? Colors.green.withOpacity(0.3)
              : Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            if (widget.candidate.image != null)
              CandidateImage(candidate: widget.candidate),
            Text(
              widget.candidate.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              widget.candidate.description,
              style: TextStyle(
                fontSize: 17,
                fontStyle: FontStyle.italic,
              ),
            ),
            if (!thisCandidateIsVoted())
              ElevatedButton(
                  onPressed: isSendingAPIRequest
                      ? null
                      : () async {
                          setState(() {
                            isSendingAPIRequest = true;
                          });

                          try {
                            var bodyOfReq = {
                              "email": Provider.of<UserProvider>(context,
                                      listen: false)
                                  .user!
                                  .email,
                            };

                            var response = await http.post(
                              Uri.parse("$baseURL/auth/otp/send-voting-email"),
                              headers: {
                                "Content-Type": "application/json",
                              },
                              body: jsonEncode(bodyOfReq),
                            );

                            var jsonDecoded = jsonDecode(response.body);

                            if (jsonDecoded['status'] == 'success') {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => VerifyOTPPage(
                                    candidate: widget.candidate,
                                  ),
                                ),
                              );
                            } else {
                              throw Exception(
                                  (jsonDecoded['message'] ?? jsonDecoded)
                                      .toString());
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(e.toString()),
                              ),
                            );
                          } finally {
                            setState(() {
                              isSendingAPIRequest = false;
                            });
                          }
                        },
                  child: isSendingAPIRequest
                      ? CupertinoActivityIndicator()
                      : Text("Vote"))
            else
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon((Icons.check)),
                    SizedBox(
                      width: 8,
                    ),
                    Text("Your Vote"),
                  ],
                ),
              )
          ],
        ),
      );
    });
  }
}
