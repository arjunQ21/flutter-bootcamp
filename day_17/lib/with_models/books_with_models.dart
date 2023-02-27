import 'package:day_17/models/book.dart';
import 'package:day_17/with_models/single_book_tile.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class BooksWithModels extends StatefulWidget {
  const BooksWithModels({super.key});

  @override
  State<BooksWithModels> createState() => _BooksWithModelsState();
}

class _BooksWithModelsState extends State<BooksWithModels> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Books"),
      ),
      body: ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) {
            return SingleBookTileFromModel(book: Book.fromMap(books[index]) );
          }),
    );
  }
}
