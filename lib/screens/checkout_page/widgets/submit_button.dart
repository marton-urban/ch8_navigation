import '../../../config/router/route_names.dart';
import '../../../models/order.dart';
import '../../../repositories/providers/cart_repository/cart_repository_provider.dart';
import '../../providers/cart/cart_provider.dart';
import '../../providers/orders/orders_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.ref,
    required this.selectedSegment,
    required this.selectedTime,
    required this.selectedDate,
    required TextEditingController nameController,
  }) : _nameController = nameController;

  final WidgetRef ref;
  final Set<int> selectedSegment;
  final TimeOfDay? selectedTime;
  final DateTime? selectedDate;
  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ref.read(cartRepositoryProvider).isEmpty
          ? null
          : () {
              final selectedSegment = this.selectedSegment;
              final selectedTime = this.selectedTime;
              final selectedDate = this.selectedDate;
              final name = _nameController.text;
              final items = ref.read(cartRepositoryProvider).items;

              final order = Order(
                  selectedSegment: selectedSegment,
                  selectedTime: selectedTime,
                  selectedDate: selectedDate,
                  name: name,
                  items: items);

              ref.read(cartProvider.notifier).resetCart();
              ref.read(ordersProvider.notifier).addOrder(order);
              Navigator.pop(context);
              context.goNamed(RouteNames.myorders);
            },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
            '''Submit Order - \$${ref.read(cartRepositoryProvider).totalCost.toStringAsFixed(2)}'''),
      ),
    );
  }
}
