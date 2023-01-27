import 'package:day_16/providers/fruits_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteButton extends StatelessWidget {
  Map fruitDetails;
  double? sizeOfIcon;
  FavoriteButton({super.key, required this.fruitDetails, this.sizeOfIcon});

  @override
  Widget build(BuildContext context) {
    return Consumer<FruitProvider>(builder: (context, fruitProv, child) {
      return InkWell(
        onTap: () {
          fruitProv.toggleFavorite(fruitDetails['name']);
        },
        child: Icon(
          fruitDetails['isFavorite'] ? Icons.favorite : Icons.favorite_outline,
          color: Colors.red,
          size: sizeOfIcon,
        ),
      );
    });
  }
}
