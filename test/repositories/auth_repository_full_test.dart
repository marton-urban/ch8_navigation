import 'package:flutter_test/flutter_test.dart';
import 'package:yummy/repositories/auth_repository.dart';

import 'package:yummy/services/auth_service.dart';

import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';

void main() {
  SharedPreferencesAsyncPlatform.instance =
      InMemorySharedPreferencesAsync.empty();
  late AuthRepository authRepository;
  late AuthService authService;

  setUp(() {
    authService = AuthService(addDelay: false);
    authRepository = AuthRepository(authService);
  });

  group('AuthRepository Full', () {
    test('loggedIn is true after signIn', () async {
      await authRepository.signIn('test', 'test');
      expectLater(await authRepository.loggedIn, true);
    });
    test('loggedIn is false after signOut', () async {
      await authRepository.signOut();
      expectLater(await authRepository.loggedIn, false);
    });
  });
}
