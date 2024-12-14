import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../test/robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Logout success', (tester) async {
    final r = Robot(tester);
    await r.setLoggedIn();
    r.expectLoggedIn();
    await r.pumpMyApp();
    await r.tapAccountTab();
    await r.tapLogoutButton();
    r.expectLoggedOut();
    r.expectLoginButton();
  });
}
