import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yummy/screens/restaurant_page/widgets/add_cart_button.dart';
import 'package:yummy/screens/restaurant_page/widgets/cart_icon_button.dart';
import 'package:yummy/screens/restaurant_page/widgets/cart_number_container.dart';
import '../../../models/restaurant.dart';

class CartControl extends ConsumerStatefulWidget {
  const CartControl(this.item, {super.key});
  final Item item;

  @override
  ConsumerState<CartControl> createState() => _CartControlState();
}

class _CartControlState extends ConsumerState<CartControl> {
  int _cartNumber = 1;

  void incrementCartNumber() {
    setState(() {
      _cartNumber++;
    });
  }

  void decrementCartNumber() {
    setState(() {
      if (_cartNumber > 1) {
        _cartNumber--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CartIconButton(
            icon: Icons.add,
            onPressed: decrementCartNumber,
            tooltip: 'Decrease Cart Count'),
        CartNumberContainer(cartNumber: _cartNumber, colorScheme: colorScheme),
        CartIconButton(
            icon: Icons.add,
            onPressed: decrementCartNumber,
            tooltip: 'Decrease Cart Count'),
        const Spacer(),
        AddCartButton(
            widget: widget,
            cartNumber: _cartNumber,
            ref: ref,
            context: context),
        Container(color: Colors.red, height: 44.0)
      ],
    );
  }
}
