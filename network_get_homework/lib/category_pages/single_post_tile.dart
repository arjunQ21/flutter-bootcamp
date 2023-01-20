import 'package:flutter/material.dart';

class SinglePostTile extends StatelessWidget {
  const SinglePostTile({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
              title,
              style: TextStyle(
                fontSize: 19,
              ),
            ),
            Text(
              body,
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
