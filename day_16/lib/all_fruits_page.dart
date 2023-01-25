import 'package:day_16/providers/fruits_provider.dart';
import 'package:day_16/single_fruit_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllFruitsPage extends StatelessWidget {
  const AllFruitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Fruits'),
      ),
      body: Consumer<FruitProvider>(builder: (context, fruitProvider, child) {
        return SafeArea(
          child: Column(
              children: fruitProvider.fruits
                  .map((e) => ListTile(
                        onLongPress: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SingleFruitPage(
                                fruitDetails: e,
                              ),
                            ),
                          );
                        },
                        onTap: () {
                          fruitProvider.increaseQuantity(e['name']);
                        },
                        title: Text(
                          e['name'] + " " + e['quantity'].toString(),
                          style: TextStyle(fontSize: 37),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            fruitProvider.toggleFavorite(e['name']);
                          },
                          icon: Icon(
                            e['isFavorite']
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            color: Colors.red,
                          ),
                        ),
                      ))
                  .toList()),
        );
      }),
    );
  }
}
