import 'package:day_17/with_map/single_book_tile.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class BooksWithMap extends StatefulWidget {
  const BooksWithMap({super.key});

  @override
  State<BooksWithMap> createState() => _BooksWithMapState();
}

class _BooksWithMapState extends State<BooksWithMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Books"),
      ),
      body: ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) {
            return SingleBookTile(book: books[index]);
          }),
    );
  }
}
