import '../models/order.dart';

class OrderRepository {
  final List<Order> _orders = [];

  List<Order> get orders => _orders;

  void addOrder(Order order) {
    _orders.add(order);
  }

  void removeOrder(Order order) {
    _orders.remove(order);
  }

  int get totalOrders => _orders.length;
}
