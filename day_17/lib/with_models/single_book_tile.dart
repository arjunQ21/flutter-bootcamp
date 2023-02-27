import 'package:day_17/models/book.dart';
import 'package:flutter/material.dart';

class SingleBookTileFromModel extends StatefulWidget {
  Book book;

  SingleBookTileFromModel({super.key, required this.book});

  @override
  State<SingleBookTileFromModel> createState() =>
      _SingleBookTileFromModelState();
}

class _SingleBookTileFromModelState extends State<SingleBookTileFromModel> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() {
          widget.book.toggleSoldOut();
        });
      },
      onLongPress: () {
        setState(() {
          widget.book.toggleColor();
        });
      },
      title: Text(widget.book.name),
      subtitle: Text(widget.book.author),
      trailing: Icon(
        widget.book.soldOut ? Icons.check : Icons.close,
        color: widget.book.soldOut ? Colors.green : Colors.red,
      ),
      leading: Container(
        width: 25,
        height: 35,
        color: widget.book.color,
      ),
    );
  }
}
