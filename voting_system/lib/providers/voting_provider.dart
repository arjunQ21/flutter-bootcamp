import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:voting_system/models/candidate.dart';
import 'package:voting_system/utils/constants.dart';

import '../models/voting.dart';

class VotingProvider with ChangeNotifier {
  String accessToken = '';
  List<Voting> votings = [];

  VotingProvider() {
    init();
  }

  Future<void> getAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString('accessToken') ?? '';
  }

  void init() async {
    await getAuthToken();
    await fetchAllVotings();
  }

  Voting getVotingById(String votingId) {
    int votingIndex = -1;
    for (int i = 0; i < votings.length; i++) {
      if (votings[i].id == votingId) {
        votingIndex = i;
      }
    }
    if (votingIndex == -1) throw Exception("Voting not found");
    return votings[votingIndex];
  }

  void editCandidate(Candidate candidateToEdit) {
    // Finding voting to add

    Voting voting = getVotingById(candidateToEdit.votingId);

    // edit candidate in voting
    int candidateIndex = -1;
    for (int i = 0; i < voting.candidates.length; i++) {
      if (voting.candidates[i].id == candidateToEdit.id) {
        candidateIndex = i;
      }
    }
    if (candidateIndex == -1) throw Exception("Candidate not found");
    voting.candidates[candidateIndex].description = candidateToEdit.description;
    voting.candidates[candidateIndex].name = candidateToEdit.name;
    voting.candidates[candidateIndex].image = candidateToEdit.image;
    //update UI
    notifyListeners();
  }

  void addCandidate(Candidate candidateToAdd) {
    Voting voting = getVotingById(candidateToAdd.votingId);
    // add candidate to voting
    voting.candidates.add(candidateToAdd);

    //update UI
    notifyListeners();
  }

  void delete(String votingID) {
    int foundIndex = -1;
    for (int i = 0; i < votings.length; i++) {
      if (votings[i].id == votingID) {
        foundIndex = i;
      }
    }

    if (foundIndex != -1) {
      votings.removeAt(foundIndex);
    } else {
      print("Voting not found");
    }
    notifyListeners();
  }

  void setVoting(Voting voting) {
// finding voting from the list
    int foundIndex = -1;

    for (int i = 0; i < votings.length; i++) {
      if (votings[i].id == voting.id) {
        foundIndex = i;
      }
    }

    if (foundIndex == -1) {
      // condition of adding new voting
      votings.add(voting);
    } else {
      // condition of updating existing voting
      votings[foundIndex] = voting;
    }

    notifyListeners();
  }

  Future<void> fetchAllVotings() async {
    var response = await http.get(Uri.parse("$baseURL/votings"), headers: {
      "Authorization": "Bearer $accessToken",
    });

    var jsonDecodedResponse = jsonDecode(response.body);

    if (jsonDecodedResponse['status'] == "success") {
      var rawVotings = jsonDecodedResponse['data'];
      for (int i = 0; i < rawVotings.length; i++) {
        Voting parsedVoting = Voting.fromJson(rawVotings[i]);
        votings.add(parsedVoting);
      }
    } else {
      print("Something bad happened. ${response.body}");
    }
    notifyListeners();
  }
}
