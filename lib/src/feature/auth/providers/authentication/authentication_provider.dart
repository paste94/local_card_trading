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
    return const AuthenticationState();
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      state = state.copyWith(loading: true);
      await _authRepo.logInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _authRepo.user.listen(
        (user) => _userChanged(user),
      );
    } catch (e) {
      state = state.copyWith(loading: false);
      rethrow;
    }
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    try {
      state = state.copyWith(loading: true);
      await _authRepo.signUp(
        email: email,
        password: password,
      );
      _authRepo.user.listen(
        (user) => _userChanged(user),
      );
    } catch (e) {
      state = state.copyWith(loading: false);
      rethrow;
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      state = state.copyWith(loading: true);
      await _authRepo.logInWithGoogle();
      _authRepo.user.listen(
        (user) => _userChanged(user),
      );
    } catch (e) {
      state = state.copyWith(loading: false);
      rethrow;
    }
  }

  void _userChanged(User user) {
    state = state.copyWith(user: user);
  }

  void openRegisterPage() {
    state = state.copyWith(wannaRegister: true);
  }

  void closeRegisterPage() {
    state = state.copyWith(wannaRegister: false);
  }
}
