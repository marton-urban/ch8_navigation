import 'package:yummy/config/router/router_provider.dart';
import '../../../config/router/route_names.dart';
import '../../../models/order.dart';
import '../../../repositories/providers/cart_repository/cart_repository_provider.dart';
import '../../providers/cart/cart_provider.dart';
import '../../providers/orders/orders_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubmitButton extends ConsumerWidget {
  const SubmitButton({
    super.key,
    required this.selectedSegment,
    required this.selectedTime,
    required this.selectedDate,
    required TextEditingController nameController,
  }) : _nameController = nameController;

  final Set<int> selectedSegment;
  final TimeOfDay? selectedTime;
  final DateTime? selectedDate;
  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: ref.read(cartRepositoryProvider).isEmpty
          ? null
          : () async {
              final cartNotifier = ref.read(cartProvider.notifier);
              final ordersNotifier = ref.read(ordersProvider.notifier);
              final goRouterProvider = ref.read(routerProvider);
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

              Navigator.of(context).pop();
              cartNotifier.resetCart();
              ordersNotifier.addOrder(order);
              await Future.delayed(Duration(milliseconds: 200));
              goRouterProvider.goNamed(RouteNames.myorders);
            },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
            '''Submit Order - \$${ref.read(cartRepositoryProvider).totalCost.toStringAsFixed(2)}'''),
      ),
    );
  }
}
