import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yummy/services/yummy_service.dart';

part 'yummy_service_provider.g.dart';

@riverpod
YummyService yummyService(Ref ref) {
  return YummyService();
}
