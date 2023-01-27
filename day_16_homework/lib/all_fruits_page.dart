import 'package:day_16/add_new_fruit.dart';
import 'package:day_16/components/favorite_button.dart';
import 'package:day_16/components/fruit_tile.dart';
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
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AddNewFruit()));
            },
          ),
        ],
      ),
      body: Consumer<FruitProvider>(builder: (context, fruitProvider, child) {
        return SafeArea(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: fruitProvider.fruits.length,
                itemBuilder: ((context, index) =>
                    FruitTile(fruitDetails: fruitProvider.fruits[index])),
              ),
            ],
          ),
        );
      }),
    );
  }
}
