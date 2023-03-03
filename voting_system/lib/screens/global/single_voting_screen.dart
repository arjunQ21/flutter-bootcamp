import 'package:flutter/material.dart';
import 'package:voting_system/components/global/candidate_image.dart';
import 'package:voting_system/models/candidate.dart';

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

class VotingCandidateCard extends StatelessWidget {
  const VotingCandidateCard({
    Key? key,
    required this.candidate,
  }) : super(key: key);

  final Candidate candidate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          if (candidate.image != null) CandidateImage(candidate: candidate),
          Text(
            candidate.name,
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
            candidate.description,
            style: TextStyle(
              fontSize: 17,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
