import 'dart:convert';

import 'package:flutter/cupertino.dart';
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

  bool isFetchingFromURL = false;

  Future<void> fetchPosts() async {
    isFetchingFromURL = true;

    setState(() {});

    await Future.wait([Future.delayed(Duration(seconds: 2))]);

    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    isFetchingFromURL = false;

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
      appBar: AppBar(title: Text("Posts")),
      body: (isFetchingFromURL)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CupertinoActivityIndicator(
                    radius: 20,
                  ),
                  SizedBox(height: 20),
                  Text("Fetching posts. Please wait."),
                ],
              ),
            )
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                // print(index);
                return SinglePostTile(
                  post: posts[index],
                );
              },
            ),
    );
  }
}
