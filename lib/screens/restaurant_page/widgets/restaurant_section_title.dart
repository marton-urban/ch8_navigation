import 'package:flutter/material.dart';

class RestaurantSectionTitle extends StatelessWidget {
  const RestaurantSectionTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Menu',
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
