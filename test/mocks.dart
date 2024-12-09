import 'package:mocktail/mocktail.dart';
import 'package:yummy/services/auth_service.dart';

class MockAuthService extends Mock implements AuthService {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}
