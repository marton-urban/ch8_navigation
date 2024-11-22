import 'package:yummy/models/cart_item.dart';

class CartRepository {
  final List<CartItem> _items = [];
  DeliveryMode _mode = DeliveryMode.pickup;
  DateTime? _timeOfPickupOrDelivery;

  void addItem(CartItem item) {
    _items.add(item);
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
  }

  void resetCart() {
    _items.clear();
    _mode = DeliveryMode.pickup;
    _timeOfPickupOrDelivery = null;
  }

  CartItem itemAt(int index) {
    if (index >= 0 && index < _items.length) {
      return _items[index];
    } else {
      throw IndexError.withLength(index, _items.length);
    }
  }

  double get totalCost {
    return _items.fold(0.0, (sum, item) => sum + item.totalCost);
  }

  List<CartItem> get items => List.unmodifiable(_items);

  bool get isEmpty => _items.isEmpty;

  void setMode(DeliveryMode mode) {
    _mode = mode;
  }

  DeliveryMode get mode => _mode;

  void setTime(DateTime time) {
    _timeOfPickupOrDelivery = time;
  }

  DateTime? get time => _timeOfPickupOrDelivery;
}
