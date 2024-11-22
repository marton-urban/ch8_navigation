import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:yummy/models/cart_item.dart';
import 'package:yummy/models/restaurant.dart';
import 'package:yummy/screens/providers/cart/cart_provider.dart';

class AddCartButton extends ConsumerWidget {
  const AddCartButton({
    super.key,
    required this.item,
    required int cartNumber,
  }) : _cartNumber = cartNumber;

  final Item item;
  final int _cartNumber;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
      onPressed: () {
        final cartItem = CartItem(
            id: Uuid().v4(),
            name: item.name,
            price: item.price,
            quantity: _cartNumber);

        ref.read(cartProvider.notifier).addItem(cartItem);
        Navigator.pop(context);
      },
      child: const Text('Add to Cart'),
    );
  }
}
