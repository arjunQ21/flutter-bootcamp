import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:voting_system/components/global/candidate_image.dart';
import 'package:voting_system/utils/constants.dart';

import '../../models/candidate.dart';
import '../../models/voting.dart';

class VotingResultCard extends StatefulWidget {
  final Voting voting;
  const VotingResultCard({super.key, required this.voting});

  @override
  State<VotingResultCard> createState() => _VotingResultCardState();
}

class _VotingResultCardState extends State<VotingResultCard> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.voting.title),
        ),
        SizedBox(
          height: 350,
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex = -1;
                      return;
                    }
                    touchedIndex =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;

                    print("Touched index: $touchedIndex");
                  });
                },
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: Colors.red, width: 5),
              ),
              sectionsSpace: 5,
              centerSpaceRadius: 40,
              sections: widget.voting.candidates
                  .map((c) => PieChartSectionData(
                        color: votingResultColors[
                            widget.voting.candidates.indexOf(c)],
                        value: c.votes.toDouble(),
                        title: "${c.votes} votes",
                        radius:
                            touchedIndex == widget.voting.candidates.indexOf(c)
                                ? 120
                                : 80,
                        titleStyle: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                        badgeWidget: c.image == null
                            ? Icon(Icons.person)
                            : CandidateImage(
                                candidate: c,
                                showSmall: true,
                              ),
                        badgePositionPercentageOffset: .98,
                      ))
                  .toList(),
            ),
          ),
        ),
        Column(
          children: widget.voting.candidates
              .map((e) => VotingResultCandidateTile(
                    candidate: e,
                    voting: widget.voting,
                  ))
              .toList(),
        ),
        Divider(
          thickness: 2,
        ),
      ],
    );
  }
}

class VotingResultCandidateTile extends StatelessWidget {
  VotingResultCandidateTile({
    super.key,
    required this.candidate,
    required this.voting,
  });

  final Candidate candidate;
  final Voting voting;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 25,
                width: 25,
                color: votingResultColors[voting.candidates.indexOf(candidate)],
              ),
              SizedBox(width: 10),
              Text(candidate.name),
            ],
          ),
          Text(candidate.votes.toString()),
        ],
      ),
    );
  }
}
