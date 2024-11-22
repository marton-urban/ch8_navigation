import 'package:flutter/material.dart';
import 'package:yummy/models/restaurant.dart';

class RestaurantItemListTile extends StatelessWidget {
  const RestaurantItemListTile({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(8.0),
      title: Text(item.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text('${item.price}'),
              const SizedBox(width: 4),
              const Icon(Icons.thumb_up, color: Colors.green, size: 18),
            ],
          ),
        ],
      ),
    );
  }
}
