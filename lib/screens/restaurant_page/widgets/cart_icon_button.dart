import 'package:flutter/material.dart';

class CartIconButton extends StatelessWidget {
  const CartIconButton(
      {required this.icon,
      required this.onPressed,
      required this.tooltip,
      super.key});

  final IconData icon;
  final VoidCallback onPressed;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
      tooltip: tooltip,
    );
  }
}
