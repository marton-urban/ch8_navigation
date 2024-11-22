import 'package:flutter/material.dart';
import 'package:yummy/models/order.dart';

class OrderTile extends StatelessWidget {
  final Order order;

  const OrderTile({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          'assets/food/burger.webp',
          width: 50.0,
          height: 50.0,
          fit: BoxFit.cover,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Scheduled',
            style: textTheme.bodyLarge,
          ),
          Text(order.getFormattedOrderInfo()),
          Text('Items: ${order.items.length}'),
        ],
      ),
    );
  }
}
