import '../../../repositories/providers/cart_repository/cart_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FloatingCartButton extends ConsumerWidget {
  const FloatingCartButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartRepository = ref.watch(cartRepositoryProvider);
    return FloatingActionButton.extended(
      onPressed: Scaffold.of(context).openEndDrawer,
      tooltip: 'Cart',
      icon: const Icon(Icons.shopping_cart),
      label: Text('${cartRepository.items.length} Items in cart'),
    );
  }
}
