import 'package:voting_system/models/candidate.dart';

class Voting {
  String id;
  String title;
  String description;
  String status;
  DateTime from;
  DateTime to;
  List<Candidate> candidates;

  Voting({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.from,
    required this.to,
    required this.candidates,
  });

  static Voting fromJson(Map<String, dynamic> json) {
    List<Candidate> includedCandidates = [];

    if (json.containsKey("candidates")) {
      for (int i = 0; i < json["candidates"].length; i++) {
        // convert map to Candidate Type
        Candidate parsed = Candidate.fromJson(json["candidates"][i]);
        // add to list
        includedCandidates.add(parsed);
      }
    }

    return Voting(
      id: json['_id'],
      candidates: includedCandidates,
      // one liner
      // candidates: (json['candidates'] as List).map((e) => Candidate.fromJson(e)).toList(),
      title: json['title'],
      description: json['description'],
      status: json['status'],
      from: DateTime.parse(json['from']),
      to: DateTime.parse(json['to']),
    );
  }
}
