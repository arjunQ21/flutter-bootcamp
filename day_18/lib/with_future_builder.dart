import 'dart:convert';

import 'package:day_18/models/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PullWithFutureBuilder extends StatelessWidget {
  const PullWithFutureBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pull with FutureBuilder")),
      body: FutureBuilder(
          future:
              http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts')),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // return listview

              var response = snapshot.data!;

              List<dynamic> jsonDecoded = jsonDecode(response.body);
              // posts = jsonDecoded.map((e) => Post.fromJson(e)).toList();

              List<Post> posts = [];

              for (int i = 0; i < jsonDecoded.length; i++) {
                posts.add(Post.fromJson(jsonDecoded[i]));
              }

              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: ((context, index) => ListTile(
                      title: Text(posts[index].title),
                      subtitle: Text(posts[index].body),
                    )),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }

            return Center(
              child: CupertinoActivityIndicator(
                radius: 20,
              ),
            );
          }),
    );
  }
}
