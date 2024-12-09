@Timeout(Duration(milliseconds: 500))
library;

import 'package:flutter_test/flutter_test.dart';
import 'package:yummy/services/auth_service.dart';
// these 2 dependencies were needed for .empty() - https://github.com/flutter/flutter/issues/153108
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';

void main() {
  late AuthService authService;
  SharedPreferencesAsyncPlatform.instance =
      InMemorySharedPreferencesAsync.empty();

  setUp(() {
    authService = AuthService(addDelay: false);
  });

  group('AuthService', () {
    test('isLoggedIn is false when auth is null', () async {
      expectLater(await authService.isLoggedIn, false);
    });
    test('isLoggedIn is true after signIn', () async {
      await authService.signIn('test', 'test');
      expectLater(await authService.isLoggedIn, true);
    });
    test('isLoggedIn is false after signOut', () async {
      await authService.signOut();
      expectLater(await authService.isLoggedIn, false);
    });
  });
}
