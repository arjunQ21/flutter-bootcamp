import 'package:flutter/material.dart';

import '../../models/candidate.dart';

class CandidateImage extends StatelessWidget {
  bool showSmall;
  CandidateImage({
    Key? key,
    required this.candidate,
    this.showSmall = false,
  }) : super(key: key);

  final Candidate candidate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      height: 150 / (showSmall ? 3 : 1),
      width: 150 / (showSmall ? 3 : 1),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(candidate.image!),
        ),
        borderRadius: BorderRadius.circular(10000.0),
        border: Border.all(
          color: Colors.blue,
          width: 2.0 / (showSmall ? 2 : 1),
        ),
      ),
    );
  }
}
