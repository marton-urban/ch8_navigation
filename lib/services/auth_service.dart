import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<bool> get isLoggedIn async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    return await SharedPreferencesAsync().getBool('auth') ?? false;
  }

  Future<void> signIn(String username, String password) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    // Sign in. Allow any password.
    return SharedPreferencesAsync().setBool('auth', true);
  }

  Future<void> signOut() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    return SharedPreferencesAsync().setBool('auth', false);
  }
}
