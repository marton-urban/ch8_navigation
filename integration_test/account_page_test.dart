import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../test/robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Logout success', (tester) async {
    final r = Robot(tester);
    await SharedPreferencesAsync().setBool('auth', true);
    expect(await SharedPreferencesAsync().getBool('auth'), true);
    await r.pumpMyApp();
    await r.tapAccountTab();
    await r.tapLogoutButton();
    r.expectLoginButton();
    expect(await SharedPreferencesAsync().getBool('auth'), false);
  });
}
