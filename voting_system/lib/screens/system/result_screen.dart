import 'package:flutter/material.dart';
import 'package:jsend/jsend.dart';

import '../../models/voting.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

Future<List<Voting>> getInvolvedVotings()async {

var response = await jsendResponse.fromAPIRequest(APIRequest(
path: "/users/me/votings",
method: "GET",
)) ;

if(response.status == 'success'){

  var rawVotings = response.data['votings'] as List ;

  List<Voting> parsedVotings = [] ;

  for(var rawVoting in rawVotings){

    parsedVotings.add(Voting.fromJson(rawVoting)) ;

  }

  return parsedVotings ;

}else{
  throw Exception("Failed to fetch votings: ${response.message}") ;
}

}


  @override
  Widget build(BuildContext context) {
    return FutureBuilder( future: 
    
    
    
    , builder: ((context, snapshot) {}));
  }
}
