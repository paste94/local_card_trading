import 'dart:io';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:local_card_trading/src/core/errors/error_provider.dart';
import 'package:local_card_trading/src/core/navigation/state/navigation_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_provider.g.dart';

@riverpod
class Navigation extends _$Navigation {
  final NavigationRepository _authRepo = NavigationRepository();

  @override
  NavigationState build() {
    _authRepo.user.listen(
      (user) => _userChanged(user),
    );
    return const NavigationState();
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      _setLoading(true);
      await _authRepo.logInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _setLoading(false);
    } on LogInWithEmailAndPasswordFailure catch (e) {
      _setLoading(false);
      _setError(e.message);
    }
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    try {
      _setLoading(true);
      await _authRepo.signUp(
        email: email,
        password: password,
      );
      _setLoading(false);
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      _setLoading(false);
      _setError(e.message);
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      await _authRepo.logInWithGoogle();
    } on LogInWithGoogleFailure catch (e) {
      _setError(e.message);
    }
  }

  Future<void> logout() async {
    try {
      await _authRepo.logOut();
    } on LogOutFailure catch (e) {
      _setError(e.message);
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

  Future<void> userUpdatePhoto(File imgFile) async {
    try {
      _setLoading(true);
      await _authRepo.updateImage(imgFile);
      _setLoading(false);
    } on UpdatePhotoFailure catch (e) {
      _setLoading(false);
      _setError(e.message);
    }
  }

  Future<void> updateName(String newName) async {
    try {
      _setLoading(true);
      await _authRepo.updateUserName(newName);
      _setLoading(false);
    } on UpdateNameFailure catch (e) {
      _setLoading(false);
      _setError(e.message);
    }
  }

  Future<void> updatePassword(
    String currentPassword,
    String newPassword,
  ) async {
    try {
      _setLoading(true);
      await _authRepo.updatePassword(
        currentPassword,
        newPassword,
      );
      _setLoading(false);
    } on UpdatePasswordFailure catch (e) {
      _setLoading(false);
      _setError(e.message);
    }
  }

  void _setError(String errorStr) {
    ref.read(errorProvider.notifier).setError(error: errorStr);
  }

  Future<void> _setLoading(bool val) async {
    state = state.copyWith(isLoading: val);
  }

  Future<void> setLoading(bool val) async {
    state = state.copyWith(isLoading: val);
  }

  void openAddCardPage() {
    state = state.copyWith(isAddCardPageOpen: true);
  }

  void closeAddCardPage() {
    state = state.copyWith(isAddCardPageOpen: false);
  }

  void closeFullScreenImage() {
    state = state.copyWith(fullScreenImage: null);
  }

  void openFullScreenImage(String url) {
    state = state.copyWith(fullScreenImage: url);
  }
}
