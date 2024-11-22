import 'package:flutter/material.dart';

class CartNumberContainer extends StatelessWidget {
  const CartNumberContainer({
    super.key,
    required int cartNumber,
    required this.colorScheme,
  }) : _cartNumber = cartNumber;

  final int _cartNumber;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      color: colorScheme.onPrimary,
      child: Text(_cartNumber.toString()),
    );
  }
}
