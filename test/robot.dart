import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yummy/main.dart';
import 'package:yummy/repositories/auth_repository.dart';
import 'package:yummy/repositories/providers/auth_repository/auth_repository_provider.dart';
import 'package:yummy/services/auth_service.dart';
import 'package:yummy/services/providers/yummy_service/yummy_service_provider.dart';
import 'package:yummy/services/yummy_service.dart';

class Robot {
  Robot(this.tester);
  final WidgetTester tester;

  Future<void> pumpMyApp() async {
    // Override repositories
    final authRepository = AuthRepository(AuthService(addDelay: false));
    final yummyService = YummyService(addDelay: false);
    // * Create ProviderContainer with any required overrides
    final container = ProviderContainer(
      overrides: [
        authRepositoryProvider.overrideWithValue(authRepository),
        yummyServiceProvider.overrideWithValue(yummyService),
      ],
    );

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
    await tester.pumpAndSettle();
  }

  Future<void> tapLogoutButton() async {
    final logoutButton = find.text('Logout');
    expect(logoutButton, findsOneWidget);
    await tester.tap(logoutButton);
    await tester.pumpAndSettle();
  }

  void expectLoginButton() {
    final loginButton = find.text('Login');
    expect(loginButton, findsOneWidget);
  }
}
