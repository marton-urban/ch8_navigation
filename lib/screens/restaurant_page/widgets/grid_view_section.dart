import 'package:flutter/material.dart';
import 'package:yummy/models/restaurant.dart';
import 'grid_item.dart';
import 'restaurant_section_title.dart';

class GridViewSection extends StatelessWidget {
  const GridViewSection(
    this.restaurant, {
    super.key,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    const desktopThreshold2 = 700;
    final columns =
        MediaQuery.of(context).size.width > desktopThreshold2 ? 2 : 1;
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RestaurantSectionTitle(),
            GridView.builder(
              padding: const EdgeInsets.all(0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 3.5,
                crossAxisCount: columns,
              ),
              itemBuilder: (context, index) => GridItem(restaurant, index),
              itemCount: restaurant.items.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ],
        ),
      ),
    );
  }
}
