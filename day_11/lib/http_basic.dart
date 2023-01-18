import 'dart:convert';

import 'package:day_11/single_post_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpBasicPage extends StatefulWidget {
  const HttpBasicPage({super.key});

  @override
  State<HttpBasicPage> createState() => _HttpBasicPageState();
}

class _HttpBasicPageState extends State<HttpBasicPage> {
  String responseFromServer = "";
  List postsFromServer = [];

  @override
  void initState() {
    getDataFromInternet();
    super.initState();
  }

  Future<void> getDataFromInternet() async {
    var data =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    setState(() {
      responseFromServer = data.body;
    });

    print(data.body.runtimeType);

    var parsedData = jsonDecode(data.body);

    setState(() {
      postsFromServer = parsedData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
              child: Column(
            children: [
              for (var post in postsFromServer)
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SinglePostPage(
                              titleOfPage: post['title'],
                            )));
                  },
                  title: Text(post['title']),
                  subtitle: Text(post['body']),
                ),
            ],
          )),
        ),
      ),
    );
  }
}
