import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../models/voting.dart';

class VotingResultCard extends StatefulWidget {
  final Voting voting;
  const VotingResultCard({super.key, required this.voting});

  @override
  State<VotingResultCard> createState() => _VotingResultCardState();
}

class _VotingResultCardState extends State<VotingResultCard> {
  int touchedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
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
              });
            },
          ),
          borderData: FlBorderData(
            show: false,
          ),
          sectionsSpace: 5,
          centerSpaceRadius: 40,
          // ignore: unnecessary_cast
          sections: (widget.voting.candidates
              .map((c) => PieChartSectionData(
                    color: Colors.blue,
                    value: c.votes.toDouble(),
                    title: c.name,
                    radius: 45,
                    titleStyle: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                    badgeWidget: FlutterLogo(),
                    badgePositionPercentageOffset: .98,
                  ))
              .toList() as List<PieChartSectionData>),
        ),
      ),
    );
  }
}
