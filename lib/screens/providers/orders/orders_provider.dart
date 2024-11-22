import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../models/order.dart';
import '../../../repositories/providers/order_repository/order_repository_provider.dart';

part 'orders_provider.g.dart';

@riverpod
class Orders extends _$Orders {
  @override
  List<Order> build() {
    return ref.read(orderRepositoryProvider).orders;
  }

  void addOrder(Order order) {
    ref.read(orderRepositoryProvider).addOrder(order);
    state = [...ref.read(orderRepositoryProvider).orders];
  }

  void removeOrder(Order order) {
    ref.read(orderRepositoryProvider).removeOrder(order);
    state = [...ref.read(orderRepositoryProvider).orders];
  }
}
