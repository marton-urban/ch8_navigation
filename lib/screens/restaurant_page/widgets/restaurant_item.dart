import 'package:flutter/material.dart';
import 'package:yummy/models/restaurant.dart';
import 'package:yummy/screens/restaurant_page/widgets/restaurant_item_image_stack.dart';
import 'package:yummy/screens/restaurant_page/widgets/restaurant_item_list_tile.dart';

class RestaurantItem extends StatelessWidget {
  final Item item;

  const RestaurantItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: RestaurantItemListTile(item: item)),
        RestaurantItemImageStack(item: item, colorScheme: colorScheme),
      ],
    );
  }
}
