import 'package:flutter/material.dart';

class SingleBookTile extends StatefulWidget {
  Map<String, dynamic> book;

  SingleBookTile({super.key, required this.book});

  @override
  State<SingleBookTile> createState() => _SingleBookTileState();
}

class _SingleBookTileState extends State<SingleBookTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() {
          widget.book['soldOut'] = !widget.book['soldOut'];
        });
      },
      title: Text(widget.book['name']),
      subtitle: Text(widget.book['author']),
      trailing: Icon(
        widget.book['soldOut'] ? Icons.check : Icons.close,
        color: widget.book['soldOut'] ? Colors.green : Colors.red,
      ),
      leading: Container(
        width: 25,
        height: 35,
        color: widget.book['color'],
      ),
    );
  }
}
