import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../../repositories/providers/order_repository/order_repository_provider.dart';
import '../providers/orders/orders_provider.dart';
import 'widgets/order_tile.dart';

class OrdersPage extends ConsumerWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(ordersProvider);
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('My Orders', style: textTheme.headlineMedium),
      ),
      body: ListView.builder(
        itemCount: ref.read(orderRepositoryProvider).totalOrders,
        itemBuilder: (context, index) {
          return OrderTile(
              order: ref.read(orderRepositoryProvider).orders[index]);
        },
      ),
    );
  }
}
