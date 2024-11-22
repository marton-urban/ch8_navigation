import '../services/auth_service.dart';

class AuthRepository {
  AuthRepository(this.authService);
  final AuthService authService;

  Future<bool> get loggedIn {
    return authService.isLoggedIn;
  }

  Future<void> signIn(String username, String password) {
    return authService.signIn(username, password);
  }

  Future<void> signOut() {
    return authService.signOut();
  }
}
