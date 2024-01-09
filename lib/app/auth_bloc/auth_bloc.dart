import 'dart:async';
import 'dart:io';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(
          authenticationRepository.currentUser.isNotEmpty
              ? AuthState.authenticated(authenticationRepository.currentUser)
              : const AuthState.unauthenticated(),
        ) {
    on<_AuthUserChanged>(_onUserChanged);
    on<AuthLogoutRequested>(_onLogoutRequested);
    on<AuthUserUpdateName>(_onAuthUserUpdateName);
    on<AuthUserUpdatePassword>(_onAuthUserUpdatePassword);
    on<AuthUserUpdatePhoto>(_onAuthUserUpdatePhoto);
    on<AuthUserError>(_onAuthUserError);
    on<AuthUserResetError>(_onAuthUserResetError);

    _userSubscription = _authenticationRepository.user.listen(
      (user) => add(_AuthUserChanged(user)),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  late final StreamSubscription<User> _userSubscription;

  void _onUserChanged(_AuthUserChanged event, Emitter<AuthState> emit) {
    emit(event.user.isNotEmpty
        ? AuthState.authenticated(event.user)
        : const AuthState.unauthenticated());
  }

  void _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) {
    unawaited(_authenticationRepository.logOut());
  }

  Future<void> _onAuthUserUpdateName(
    AuthUserUpdateName event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      await _authenticationRepository.updateUserName(event.newName);
      emit(state.copyWith(isLoading: false));
      event.onSuccess();
    } on UpdateNameFailure catch (e) {
      print('ERROR - ${e.message}');
      emit(state.copyWith(
        isLoading: false,
        errorMsg: e.message,
      ));
    }
  }

  Future<void> _onAuthUserUpdatePassword(
    AuthUserUpdatePassword event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      await _authenticationRepository.updatePassword(
        event.currentPassword,
        event.newPassword,
      );
      emit(state.copyWith(isLoading: false));
      event.onSuccess();
    } on UpdatePasswordFailure catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMsg: e.message,
      ));
    }
  }

  Future<void> _onAuthUserUpdatePhoto(
    AuthUserUpdatePhoto event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      await _authenticationRepository.updateImage(
        event.newPhoto,
      );
      emit(state.copyWith(isLoading: false));
    } on UpdatePasswordFailure catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMsg: e.message,
      ));
    }
  }

  void _onAuthUserError(
    AuthUserError event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(errorMsg: event.errorMsg));
  }

  void _onAuthUserResetError(
    AuthUserResetError event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(errorMsg: ''));
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
