import 'package:day_18/functions.dart';
import 'package:day_18/models/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PullWithFutureBuilder extends StatelessWidget {
  const PullWithFutureBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pull with FutureBuilder")),
      body: FutureBuilder(
          future: getPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Post> posts = snapshot.data as List<Post>;

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

            return const Center(
              child: CupertinoActivityIndicator(
                radius: 20,
              ),
            );
          }),
    );
  }
}
