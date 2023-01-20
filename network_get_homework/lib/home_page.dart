import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:network_get_homework/category_pages/posts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Browse Categories'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PostsPage()),
                  );
                },
                child: Text("Posts")),
            ElevatedButton(onPressed: () {}, child: Text("Todos")),
            ElevatedButton(onPressed: () {}, child: Text("Users")),
            ElevatedButton(onPressed: () {}, child: Text("Photos")),
          ],
        ),
      ),
    );
  }
}
