import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(
          authenticationRepository.currentUser.isNotEmpty
              ? AppState.authenticated(authenticationRepository.currentUser)
              : const AppState.unauthenticated(),
        ) {
    on<_AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
    on<AppUserUpdateName>(_onAppUserUpdateName);
    on<AppUserUpdatePassword>(_onAppUserUpdatePassword);
    on<AppUserError>(_onAppUserError);
    on<AppUserResetError>(_onAppUserResetError);

    _userSubscription = _authenticationRepository.user.listen(
      (user) => add(_AppUserChanged(user)),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  late final StreamSubscription<User> _userSubscription;

  void _onUserChanged(_AppUserChanged event, Emitter<AppState> emit) {
    emit(event.user.isNotEmpty
        ? AppState.authenticated(event.user)
        : const AppState.unauthenticated());
  }

  void _onLogoutRequested(
    AppLogoutRequested event,
    Emitter<AppState> emit,
  ) {
    unawaited(_authenticationRepository.logOut());
  }

  Future<void> _onAppUserUpdateName(
    AppUserUpdateName event,
    Emitter<AppState> emit,
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

  Future<void> _onAppUserUpdatePassword(
    AppUserUpdatePassword event,
    Emitter<AppState> emit,
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

  void _onAppUserError(
    AppUserError event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(errorMsg: event.errorMsg));
  }

  void _onAppUserResetError(
    AppUserResetError event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(errorMsg: ''));
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
