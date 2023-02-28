import 'dart:convert';

import 'models/post.dart';
import 'package:http/http.dart' as http;

Future<List<Post>> getPosts() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  List<dynamic> jsonDecoded = jsonDecode(response.body);

  List<Post> posts = [];
  for (int i = 0; i < jsonDecoded.length; i++) {
    posts.add(Post.fromJson(jsonDecoded[i]));
  }
  return posts;
}
