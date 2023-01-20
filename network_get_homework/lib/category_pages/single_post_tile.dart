import 'package:flutter/material.dart';
import 'package:network_get_homework/category_pages/single_post_page.dart';

class SinglePostTile extends StatelessWidget {
  SinglePostTile({
    Key? key,
    required this.post,
  }) : super(key: key);

  var post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SinglePostPage(post: post)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post['title'],
              style: TextStyle(
                fontSize: 19,
              ),
            ),
            Text(
              post['body'],
              style: TextStyle(
                  // fontSize: 19,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
