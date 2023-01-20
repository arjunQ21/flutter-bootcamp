import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:network_get_homework/category_pages/single_post_tile.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  List posts = [];

  Future<void> fetchPosts() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    var stringBody = response.body;
    var jsonBody = jsonDecode(stringBody);

    setState(() {
      posts = jsonBody;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          // print(index);
          return SinglePostTile(
            title: posts[index]["title"],
            body: posts[index]["body"],
          );
        },
      ),
    );
  }
}
