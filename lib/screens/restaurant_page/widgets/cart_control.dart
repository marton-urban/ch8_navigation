import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../models/cart_item.dart';
import '../../../models/restaurant.dart';
import '../../providers/cart/cart_provider.dart';

class CartControl extends ConsumerStatefulWidget {
  const CartControl(this.item, {super.key});
  final Item item;

  @override
  ConsumerState<CartControl> createState() => _CartControlState();
}

class _CartControlState extends ConsumerState<CartControl> {
  int _cartNumber = 1;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildMinusButton(),
        _buildCartNumberContainer(colorScheme),
        _buildPlusButton(),
        const Spacer(),
        _buildAddCartButton(),
        Container(color: Colors.red, height: 44.0)
      ],
    );
  }

  Widget _buildMinusButton() {
    return IconButton(
      icon: const Icon(Icons.remove),
      onPressed: () {
        setState(() {
          if (_cartNumber > 1) {
            _cartNumber--;
          }
        });
      },
      tooltip: 'Decrease Cart Count',
    );
  }

  Widget _buildCartNumberContainer(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      color: colorScheme.onPrimary,
      child: Text(_cartNumber.toString()),
    );
  }

  Widget _buildPlusButton() {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        setState(() {
          _cartNumber++;
        });
      },
      tooltip: 'Increase Cart Count',
    );
  }

  Widget _buildAddCartButton() {
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
