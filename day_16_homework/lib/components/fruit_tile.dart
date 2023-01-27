import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/fruits_provider.dart';
import '../single_fruit_page.dart';
import 'favorite_button.dart';

class FruitTile extends StatelessWidget {
  Map<String, dynamic> fruitDetails;
  FruitTile({super.key, required this.fruitDetails});



  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SingleFruitPage(
              fruitDetails: fruitDetails,
            ),
          ),
        );
      },
      onTap: () {
        FruitProvider fruitProvider =
            Provider.of<FruitProvider>(context, listen: false);
        fruitProvider.increaseQuantity(fruitDetails['name']);
      },
      title: Text(
        fruitDetails['name'] + " " + fruitDetails['quantity'].toString(),
        style: TextStyle(fontSize: 37),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Are you sure?"),
                    content: Text(
                      "Do you want to delete ${fruitDetails['name']}",
                    ),
                    actions: [
                      TextButton(
                        child: Text(
                          "No",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text("Yes"),
                        onPressed: () {
                          FruitProvider provider = Provider.of<FruitProvider>(
                              context,
                              listen: false);
                          provider.deleteFruit(fruitDetails['name']);
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(fruitDetails['name'] + " deleted"),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(Icons.delete)),
          FavoriteButton(fruitDetails: fruitDetails),
        ],
      ),
    );
  }
}
