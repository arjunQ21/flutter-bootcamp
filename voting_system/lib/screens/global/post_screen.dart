// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:voting_system/components/global/post_card.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          PostCard(
            isAdmin: true,
            postTitle: 'President Of Nepal',
            startTime: DateTime.now(),
            endTime: DateTime.now(),
            candiates: 2,
            handleView: () {
              print('View');
            },
            handleEdit: () {
              print('Edit');
            },
            handleDelete: () {
              print('Delete');
            },
          ),
        ],
      ),
    );
  }
}
