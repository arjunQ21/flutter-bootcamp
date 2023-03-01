import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
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
