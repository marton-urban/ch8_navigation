import 'package:flutter/material.dart';
import 'package:yummy/models/restaurant.dart';

class RestaurantItemImageStack extends StatelessWidget {
  const RestaurantItemImageStack({
    super.key,
    required this.item,
    required this.colorScheme,
  });

  final Item item;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Image.network(
                item.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 8.0,
          right: 8.0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: const Text(
              'Add',
              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
