import 'package:mocktail/mocktail.dart';
import 'package:yummy/repositories/auth_repository.dart';
import 'package:yummy/services/auth_service.dart';

class MockAuthService extends Mock implements AuthService {}

class MockAuthRepository extends Mock implements AuthRepository {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}
