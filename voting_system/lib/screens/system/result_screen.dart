import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jsend/jsend.dart';

import '../../models/voting.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int touchedIndex = 0;

  Future<List<Voting>> getInvolvedVotings() async {
    var response = await jsendResponse.fromAPIRequest(APIRequest(
      path: "/users/me/votings",
      method: "GET",
    ));

    if (response.status == 'success') {
      var rawVotings = response.data['votings'] as List;

      List<Voting> parsedVotings = [];

      for (var rawVoting in rawVotings) {
        parsedVotings.add(Voting.fromJson(rawVoting));
      }

      return parsedVotings;
    } else {
      throw Exception("Failed to fetch votings: ${response.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getInvolvedVotings(),
      builder: ((context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (snapshot.hasData) {
          var resultVotings = snapshot.data as List<Voting>;
          return SingleChildScrollView(
            child: Column(
              // ignore: unnecessary_cast
              children: (resultVotings
                  .map(
                    (rv) => SizedBox(
                      height: 500,
                      child: PieChart(
                        PieChartData(
                          pieTouchData: PieTouchData(
                            touchCallback:
                                (FlTouchEvent event, pieTouchResponse) {
                              setState(() {
                                if (!event.isInterestedForInteractions ||
                                    pieTouchResponse == null ||
                                    pieTouchResponse.touchedSection == null) {
                                  touchedIndex = -1;
                                  return;
                                }
                                touchedIndex = pieTouchResponse
                                    .touchedSection!.touchedSectionIndex;
                              });
                            },
                          ),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 5,
                          centerSpaceRadius: 40,
                          // ignore: unnecessary_cast
                          sections: (rv.candidates
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
                    ),
                  )
                  .toList() as List<Widget>),
            ),
          );
        }
        return Center(child: CupertinoActivityIndicator());
      }),
    );
  }
}
