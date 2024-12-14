import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yummy/main.dart';
import 'package:yummy/repositories/auth_repository.dart';
import 'package:yummy/repositories/providers/auth_repository/auth_repository_provider.dart';
import 'package:yummy/screens/providers/auth_state/auth_state_provider.dart';
import 'package:yummy/services/auth_service.dart';
import 'package:yummy/services/providers/yummy_service/yummy_service_provider.dart';
import 'package:yummy/services/yummy_service.dart';

class Robot {
  Robot(this.tester) {
    container = ProviderContainer(
      overrides: [
        authRepositoryProvider.overrideWithValue(authRepository),
        yummyServiceProvider.overrideWithValue(yummyService),
      ],
    );
  }
  final WidgetTester tester;
  late final ProviderContainer container;
  final authRepository = AuthRepository(AuthService(addDelay: false));
  final yummyService = YummyService(addDelay: false);

  Future<void> pumpMyApp() async {
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const Yummy(),
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> tapAccountTab() async {
    final finder = find.text('Account');
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pump();
  }

  Future<void> tapLogoutButton() async {
    final logoutButton = find.text('Logout');
    expect(logoutButton, findsOneWidget);
    await tester.tap(logoutButton);
    await tester.pump();
  }

  void expectLoginButton() {
    final loginButton = find.text('Login');
    expect(loginButton, findsOneWidget);
  }

  Future<void> setLoggedIn() async {
    await container.read(authStateProvider.notifier).signIn('test', 'test');
  }

  void expectLoggedIn() async {
    final loggedIn = container.read(authStateProvider).value;
    expect(loggedIn, true);
  }

  void expectLoggedOut() async {
    final loggedIn = container.read(authStateProvider).value;
    expect(loggedIn, false);
  }
}
