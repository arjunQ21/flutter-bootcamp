import 'package:day_16/providers/fruits_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleFruitPage extends StatelessWidget {
  Map fruitDetails;
  SingleFruitPage({super.key, required this.fruitDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(fruitDetails['name'])),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Consumer<FruitProvider>(builder: (context, fruitProv, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  fruitProv.toggleFavorite(fruitDetails['name']);
                },
                icon: Icon(
                  fruitDetails['isFavorite']
                      ? Icons.favorite
                      : Icons.favorite_outline,
                  color: Colors.red,
                  size: 90,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Quanity:",
                    style: TextStyle(
                      fontSize: 48,
                    ),
                  ),
                  Text(
                    fruitDetails['quantity'].toString(),
                    style: TextStyle(
                      fontSize: 48,
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
