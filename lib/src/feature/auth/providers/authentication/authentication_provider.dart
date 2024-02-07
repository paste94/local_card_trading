import 'package:authentication_repository/authentication_repository.dart';
import 'package:local_card_trading/src/feature/auth/providers/authentication/state/authentication_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_provider.g.dart';

@riverpod
class Authentication extends _$Authentication {
  final AuthenticationRepository _authRepo = AuthenticationRepository();
  late final _userSubscription;

  @override
  AuthenticationState build() {
    return const AuthenticationState.initial();
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      state = const AuthenticationState.loading();
      await _authRepo.logInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _userSubscription = _authRepo.user.listen(
        (user) => _userChanged(user),
      );
    } catch (e) {
      state = const AuthenticationState.initial();
      rethrow;
    }
  }

  void _userChanged(User user) {
    state = AuthenticationState.authenticated(user: user);
  }
}
