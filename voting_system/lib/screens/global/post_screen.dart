// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_system/components/global/post_card.dart';
import 'package:voting_system/providers/user_provider.dart';
import 'package:voting_system/providers/voting_provider.dart';

import '../../models/voting.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<VotingProvider, UserProvider>(
        builder: (context, votingProvider, userProvider, child) {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              for (Voting voting in votingProvider.votings)
                PostCard(
                  isAdmin: userProvider.user!.role == 'admin',
                  voting: voting,
                ),
            ],
          ),
        ),
      );
    });
  }
}
