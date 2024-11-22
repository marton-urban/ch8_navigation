import '../../../models/cart_item.dart';
import '../../../repositories/providers/cart_repository/cart_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderSummary extends ConsumerWidget {
  const OrderSummary({super.key, required this.onDismissed});

  final void Function(CartItem item) onDismissed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: ListView.builder(
        itemCount: ref.read(cartRepositoryProvider).items.length,
        itemBuilder: (context, index) {
          final item = ref.read(cartRepositoryProvider).itemAt(index);

          return Dismissible(
            key: Key(item.id),
            direction: DismissDirection.endToStart,
            background: Container(),
            secondaryBackground: const SizedBox(
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Icon(Icons.delete),
              ]),
            ),
            onDismissed: (direction) {
              onDismissed(item);
            },
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2.0,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  child: Text('x${item.quantity}'),
                ),
              ),
              title: Text(item.name),
              subtitle: Text('Price: \$${item.price}'),
            ),
          );
        },
      ),
    );
  }
}
