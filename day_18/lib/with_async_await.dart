import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

import 'functions.dart';
import 'models/post.dart';

class PullWithAsyncAwait extends StatefulWidget {
  const PullWithAsyncAwait({super.key});

  @override
  State<PullWithAsyncAwait> createState() => _PullWithAsyncAwaitState();
}

class _PullWithAsyncAwaitState extends State<PullWithAsyncAwait> {
  List<Post> posts = [];

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      setState(() {
        _isLoading = true;
      });

      posts = await getPosts();
     

    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pull with async/await")),
      body: _isLoading
          ? Center(
              child: CupertinoActivityIndicator(
              radius: 20,
            ))
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: ((context, index) => ListTile(
                    title: Text(posts[index].title),
                    subtitle: Text(posts[index].body),
                  )),
            ),
    );
  }
}
