import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../cart_repository.dart';

part 'cart_repository_provider.g.dart';

@riverpod
CartRepository cartRepository(Ref ref) {
  return CartRepository();
}
