import 'package:flutter/material.dart';

class TurfListPage extends StatelessWidget {
  final String city;

  TurfListPage({required this.city});

  @override
  Widget build(BuildContext context) {
    // Fetch turf data based on the selected city
    // For demonstration, we'll use placeholder data
    List<String> turfs = [
      'Turf 1 in $city',
      'Turf 2 in $city',
      'Turf 3 in $city',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Turfs in $city'),
      ),
      body: ListView.builder(
        itemCount: turfs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(turfs[index]),
          );
        },
      ),
    );
  }
}
