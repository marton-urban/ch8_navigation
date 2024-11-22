import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:yummy/models/cart_item.dart';
import 'package:yummy/screens/providers/cart/cart_provider.dart';
import 'package:yummy/screens/restaurant_page/widgets/cart_control.dart';

class AddCartButton extends StatelessWidget {
  const AddCartButton({
    super.key,
    required this.widget,
    required int cartNumber,
    required this.ref,
    required this.context,
  }) : _cartNumber = cartNumber;

  final CartControl widget;
  final int _cartNumber;
  final WidgetRef ref;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        final cartItem = CartItem(
            id: Uuid().v4(),
            name: widget.item.name,
            price: widget.item.price,
            quantity: _cartNumber);

        ref.read(cartProvider.notifier).addItem(cartItem);
        Navigator.pop(context);
      },
      child: const Text('Add to Cart'),
    );
  }
}
