import 'package:flutter/material.dart';

class SinglePostPage extends StatelessWidget {
  Map post;

  SinglePostPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(post['title'])),
      body: Text(post['body']),
    );
  }
}
