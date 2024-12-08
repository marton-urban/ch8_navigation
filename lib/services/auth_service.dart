import 'package:shared_preferences/shared_preferences.dart';

import '../utils/delay.dart';

class AuthService {
  AuthService({this.addDelay = true});

  final bool addDelay;
  final SharedPreferencesAsync prefs = SharedPreferencesAsync();

  Future<bool> get isLoggedIn async {
    await delay(addDelay, 200);
    return await prefs.getBool('auth') ?? false;
  }

  Future<void> signIn(String username, String password) async {
    await delay(addDelay, 200);
    // Sign in. Allow any password.
    return prefs.setBool('auth', true);
  }

  Future<void> signOut() async {
    await delay(addDelay, 200);
    return prefs.setBool('auth', false);
  }
}
