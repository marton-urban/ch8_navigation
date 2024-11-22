import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../models/cart_item.dart';
import '../../../repositories/providers/cart_repository/cart_repository_provider.dart';

part 'cart_provider.g.dart';

@riverpod
class Cart extends _$Cart {
  @override
  List<CartItem> build() {
    return ref.read(cartRepositoryProvider).items;
  }

  void addItem(CartItem item) {
    ref.read(cartRepositoryProvider).addItem(item);
    state = ref.read(cartRepositoryProvider).items;
  }

  void removeItem(String id) {
    ref.read(cartRepositoryProvider).removeItem(id);
    state = ref.read(cartRepositoryProvider).items;
  }

  void resetCart() {
    ref.read(cartRepositoryProvider).resetCart();
    state = ref.read(cartRepositoryProvider).items;
  }
}
