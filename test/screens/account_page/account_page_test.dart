import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';

import '../../robot.dart';

void main() {
  SharedPreferencesAsyncPlatform.instance =
      InMemorySharedPreferencesAsync.withData({'auth': true});
  testWidgets('Logout success', (tester) async {
    final r = Robot(tester);
    expect(await SharedPreferencesAsync().getBool('auth'), true);
    await r.pumpMyApp();
    await r.tapAccountTab();
    await r.tapLogoutButton();
    r.expectLoginButton();
    expect(await SharedPreferencesAsync().getBool('auth'), false);
  });
}
