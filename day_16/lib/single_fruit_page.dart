import 'package:day_16/components/favorite_button.dart';
import 'package:day_16/providers/fruits_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleFruitPage extends StatelessWidget {
  Map fruitDetails;
  SingleFruitPage({super.key, required this.fruitDetails});

  @override
  Widget build(BuildContext context) {
    return Consumer<FruitProvider>(builder: (context, fruitProv, child) {
      return Scaffold(
        appBar: AppBar(title: Text(fruitDetails['name'])),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FavoriteButton(
                fruitDetails: fruitDetails,
                sizeOfIcon: 90,
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
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            fruitProv.increaseQuantity(fruitDetails['name']);
          },
          child: Icon(Icons.add),
        ),
      );
    });
  }
}
