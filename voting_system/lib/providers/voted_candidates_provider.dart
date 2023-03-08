import 'package:flutter/material.dart';
import 'package:jsend/jsend.dart';

class VotedCandidatesProvider with ChangeNotifier {
  List<String> votedCandidates = [];

  VotedCandidatesProvider() {
    fetchFromAPI();
  }

  bool isVotedCandidate(String candidateId) {
    return votedCandidates.contains(candidateId);
  }

  fetchFromAPI() async {
    var response = await jsendResponse.fromAPIRequest(APIRequest(
      path: "/users/me/votedCandidates",
      method: "GET",
    ));
    if (response.status == 'success') {
      votedCandidates = (response.data['votedCandidates'] as List)
          .map((e) => e.toString())
          .toList();
      notifyListeners();
    } else {
      throw Exception("Failed to fetch voted candidates: ${response.message}");
    }
  }
}
