import 'package:flutter/material.dart';

class SinglePostPage extends StatelessWidget {
  String titleOfPage;

  SinglePostPage({super.key, required this.titleOfPage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titleOfPage)),
    );
  }
}
