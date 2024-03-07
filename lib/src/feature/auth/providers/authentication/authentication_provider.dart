import 'dart:io';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:local_card_trading/src/feature/auth/providers/authentication/state/authentication_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_provider.g.dart';

@riverpod
class Authentication extends _$Authentication {
  final AuthenticationRepository _authRepo = AuthenticationRepository();

  @override
  AuthenticationState build() {
    _authRepo.user.listen(
      (user) => _userChanged(user),
    );
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
      state = state.copyWith(loading: false);
    } on LogInWithEmailAndPasswordFailure catch (e) {
      state = state.copyWith(
        loading: false,
        error: e.message,
      );
      // rethrow;
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
      state = state.copyWith(loading: false);
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      state = state.copyWith(
        loading: false,
        error: e.message,
      );
      // rethrow;
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      state = state.copyWith(loading: true);
      await _authRepo.logInWithGoogle();
      state = state.copyWith(loading: false);
    } on LogInWithGoogleFailure catch (e) {
      state = state.copyWith(
        loading: false,
        error: e.message,
      );
      // rethrow;
    }
  }

  Future<void> logout() async {
    try {
      state = state.copyWith(loading: true);
      await _authRepo.logOut();
      state = state.copyWith(loading: false);
    } on LogOutFailure catch (e) {
      state = state.copyWith(
        loading: false,
        error: e.message,
      );
      // rethrow;
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

  void openDialog() {
    state = state.copyWith(loading: true);
  }

  Future<void> userUpdatePhoto(File imgFile) async {
    try {
      state = state.copyWith(loading: true);
      await _authRepo.updateImage(imgFile);
      state = state.copyWith(loading: false);
    } on UpdatePhotoFailure catch (e) {
      state = state.copyWith(
        loading: false,
        error: e.message,
      );
      // rethrow;
    }
  }

  Future<void> updateName(String newName) async {
    try {
      state = state.copyWith(loading: true);
      await _authRepo.updateUserName(newName);
      state = state.copyWith(loading: false);
    } on UpdateNameFailure catch (e) {
      state = state.copyWith(
        loading: false,
        error: e.message,
      );
      // rethrow;
    }
  }

  Future<void> updatePassword(
    String currentPassword,
    String newPassword,
  ) async {
    try {
      state = state.copyWith(loading: true);
      await _authRepo.updatePassword(
        currentPassword,
        newPassword,
      );
      state = state.copyWith(loading: false);
    } on UpdatePasswordFailure catch (e) {
      state = state.copyWith(
        loading: false,
        error: e.message,
      );
      // rethrow;
    }
  }

  void dismissError() {
    state = state.copyWith(
      error: null,
    );
  }
}
