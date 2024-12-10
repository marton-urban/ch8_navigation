import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:yummy/repositories/providers/auth_repository/auth_repository_provider.dart';
import 'package:yummy/screens/providers/auth_state/auth_state_provider.dart';

import '../../../mocks.dart';

void main() {
  late MockAuthRepository authRepository;
  late ProviderContainer container;
  late Listener<AsyncValue<bool>> listener;

  setUp(() async {
    authRepository = MockAuthRepository();
    container = ProviderContainer(
      overrides: [
        authRepositoryProvider.overrideWithValue(authRepository),
      ],
    );
    addTearDown(container.dispose);
    when(() => authRepository.loggedIn).thenAnswer((_) => Future.value(false));
    // create a listener
    listener = Listener<AsyncValue<bool>>();
    // listen to the provider and call [listener] whenever its value changes
    container.listen(
      authStateProvider,
      listener.call,
      fireImmediately: true,
    );
    await container.read(authStateProvider.future);
  });

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<bool>());
  });

  group('AuthStateProvider', () {
    test('initial state is AsyncLoading then AsyncData(false)', () {
      verifyInOrder([
        () => listener(null, AsyncLoading<bool>()),
        () => listener(AsyncLoading<bool>(), AsyncData<bool>(false)),
      ]);
      // verify that the listener is no longer called
      verifyNoMoreInteractions(listener);
      verifyNever(authRepository.signOut);
      verifyNever(() => authRepository.signIn(any(), any()));
      verify(() => authRepository.loggedIn).called(1);
    });
    test('signIn success', () async {
      when(() => authRepository.signIn('test', 'test'))
          .thenAnswer((_) => Future.value());
      when(() => authRepository.loggedIn).thenAnswer((_) => Future.value(true));
      await container.read(authStateProvider.notifier).signIn('test', 'test');
      verifyInOrder([
        () => listener(null, AsyncLoading<bool>()),
        () => listener(AsyncLoading<bool>(), AsyncData<bool>(false)),
        () => listener(AsyncData<bool>(false), any(that: isA<AsyncLoading>())),
        () => listener(any(that: isA<AsyncLoading>()), AsyncData<bool>(true)),
      ]);
      // verify that the listener is no longer called
      verifyNever(authRepository.signOut);
      verifyNoMoreInteractions(listener);
      verify(() => authRepository.loggedIn).called(2);
    });
    test('signIn failure', () async {
      when(() => authRepository.signIn('test', 'test'))
          .thenThrow(Exception('Connection failed'));
      when(() => authRepository.loggedIn)
          .thenAnswer((_) => Future.value(false));
      await container.read(authStateProvider.notifier).signIn('test', 'test');
      verifyInOrder([
        () => listener(null, AsyncLoading<bool>()),
        () => listener(AsyncLoading<bool>(), AsyncData<bool>(false)),
        () => listener(AsyncData<bool>(false), any(that: isA<AsyncLoading>())),
        () => listener(
            any(that: isA<AsyncLoading>()), any(that: isA<AsyncError>())),
      ]);
      // verify that the listener is no longer called
      verifyNever(authRepository.signOut);
      verifyNoMoreInteractions(listener);
      verify(() => authRepository.loggedIn).called(1);
    });
    test('signOut success', () async {
      when(() => authRepository.signOut()).thenAnswer((_) => Future.value());
      when(() => authRepository.loggedIn)
          .thenAnswer((_) => Future.value(false));
      await container.read(authStateProvider.notifier).signOut();
      verifyInOrder([
        () => listener(null, AsyncLoading<bool>()),
        () => listener(AsyncLoading<bool>(), AsyncData<bool>(false)),
        () => listener(AsyncData<bool>(false), any(that: isA<AsyncLoading>())),
        () => listener(any(that: isA<AsyncLoading>()), AsyncData<bool>(false)),
      ]);
      // verify that the listener is no longer called
      verifyNoMoreInteractions(listener);
      verifyNever(() => authRepository.signIn(any(), any()));
      verify(() => authRepository.loggedIn).called(2);
    });
    test('signOut failure', () async {
      when(() => authRepository.signOut())
          .thenThrow(Exception('Connection failed'));
      when(() => authRepository.loggedIn).thenAnswer((_) => Future.value(true));
      await container.read(authStateProvider.notifier).signOut();
      verifyInOrder([
        () => listener(null, AsyncLoading<bool>()),
        () => listener(AsyncLoading<bool>(), AsyncData<bool>(false)),
        () => listener(AsyncData<bool>(false), any(that: isA<AsyncLoading>())),
        () => listener(
            any(that: isA<AsyncLoading>()), any(that: isA<AsyncError>())),
      ]);
      // verify that the listener is no longer called
      verifyNoMoreInteractions(listener);
      verifyNever(() => authRepository.signIn(any(), any()));
      verify(() => authRepository.loggedIn).called(1);
    });
  });
}
