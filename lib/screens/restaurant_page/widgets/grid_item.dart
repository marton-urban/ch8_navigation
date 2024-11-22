import 'package:yummy/screens/restaurant_page/widgets/item_details.dart';
import 'package:yummy/screens/restaurant_page/widgets/restaurant_item.dart';
import 'package:flutter/material.dart';
import 'package:yummy/models/restaurant.dart';

class GridItem extends StatelessWidget {
  const GridItem(
    this.restaurant,
    this.index, {
    super.key,
  });

  final Restaurant restaurant;
  final int index;

  @override
  Widget build(BuildContext context) {
    final item = restaurant.items[index];
    return InkWell(
      onTap: () => showModalBottomSheet<void>(
        isScrollControlled: true,
        context: context,
        constraints: const BoxConstraints(maxWidth: 480),
        builder: (context) => ItemDetails(
          item: item,
        ),
      ),
      child: RestaurantItem(item: item),
    );
  }
}
