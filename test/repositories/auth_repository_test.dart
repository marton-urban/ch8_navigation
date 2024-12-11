import 'package:flutter_test/flutter_test.dart';
import 'package:yummy/repositories/auth_repository.dart';

import 'package:mocktail/mocktail.dart';

import '../mocks.dart';

void main() {
  late AuthRepository authRepository;
  late MockAuthService authService;

  setUp(() {
    authService = MockAuthService();
    authRepository = AuthRepository(authService);
  });

  group('AuthRepository', () {
    test('loggedIn is true after signIn', () async {
      when(() => authService.signIn('test', 'test'))
          .thenAnswer((_) => Future.value());
      when(() => authService.isLoggedIn).thenAnswer((_) => Future.value(true));
      await authRepository.signIn('test', 'test');
      expectLater(await authRepository.loggedIn, true);
    });
    test('loggedIn is false after signOut', () async {
      when(() => authService.signOut()).thenAnswer((_) => Future.value());
      when(() => authService.isLoggedIn).thenAnswer((_) => Future.value(false));
      await authRepository.signOut();
      expectLater(await authRepository.loggedIn, false);
    });
  });
}
