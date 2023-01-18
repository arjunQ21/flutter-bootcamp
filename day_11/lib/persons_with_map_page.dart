import 'package:flutter/material.dart';

List<Map<String, String>> persons = [
  {"name": "Arjun Adhikari", "address": "Hemja"},
  {"name": "Rajan Aryal", "address": "Fulbari"},
  {"name": "Alson", "address": "Lamachaur"},
  {"name": "Sumit Gurung", "address": "Harichowk"},
];

class PersonsWithMapPage extends StatelessWidget {
  const PersonsWithMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: persons.map((person) {
            return ListTile(
              title: Text(person['name']!),
              subtitle: Text(person['address']!),
            );
          }).toList(),
        ),
      ),
    );
  }
}
