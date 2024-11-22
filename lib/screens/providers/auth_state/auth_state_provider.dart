import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../repositories/providers/auth_repository/auth_repository_provider.dart';

part 'auth_state_provider.g.dart';

@riverpod
class AuthState extends _$AuthState {
  @override
  Future<bool> build() {
    return ref.read(authRepositoryProvider).loggedIn;
  }

  Future<void> signIn(String username, String password) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await ref.read(authRepositoryProvider).signIn(username, password);
      return ref.read(authRepositoryProvider).loggedIn;
    });
  }

  Future<void> signOut() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await ref.read(authRepositoryProvider).signOut();
      return ref.read(authRepositoryProvider).loggedIn;
    });
  }
}
