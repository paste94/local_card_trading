import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';

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
    on<_UserChanged>(_onUserChanged);
    on<LogoutRequested>(_onLogoutRequested);
    on<UserUpdateName>(_onAuthUserUpdateName);
    on<UserUpdatePassword>(_onAuthUserUpdatePassword);
    on<UserUpdatePhoto>(_onAuthUserUpdatePhoto);
    on<UserError>(_onAuthUserError);
    on<UserResetError>(_onAuthUserResetError);
    on<NavigateToAddCardToCollectionPage>(_onNavigateToAddCardToCollectionPage);
    on<CloseAddCardToCollectionPage>(_onCloseAddCardToCollectionPage);
    on<ConnectionError>(_onConnectionError);
    on<CleanConnectionError>(_onCleanConnectionError);

    _userSubscription = _authenticationRepository.user.listen(
      (user) => add(_UserChanged(user)),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  late final StreamSubscription<User> _userSubscription;

  void _onUserChanged(_UserChanged event, Emitter<AppState> emit) {
    emit(event.user.isNotEmpty
        ? AppState.authenticated(event.user)
        : const AppState.unauthenticated());
  }

  void _onLogoutRequested(
    LogoutRequested event,
    Emitter<AppState> emit,
  ) {
    unawaited(_authenticationRepository.logOut());
  }

  Future<void> _onAuthUserUpdateName(
    UserUpdateName event,
    Emitter<AppState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      await _authenticationRepository.updateUserName(event.newName);
      emit(state.copyWith(isLoading: false));
      event.onSuccess();
    } on UpdateNameFailure catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMsg: e.message,
      ));
    }
  }

  Future<void> _onAuthUserUpdatePassword(
    UserUpdatePassword event,
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

  Future<void> _onAuthUserUpdatePhoto(
    UserUpdatePhoto event,
    Emitter<AppState> emit,
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
    UserError event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(errorMsg: event.errorMsg));
  }

  void _onAuthUserResetError(
    UserResetError event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(errorMsg: ''));
  }

  void _onNavigateToAddCardToCollectionPage(
      NavigateToAddCardToCollectionPage event, Emitter<AppState> emit) {
    emit(
      state.copyWith(isNavigationAddCardToCollection: true),
    );
  }

  void _onCloseAddCardToCollectionPage(
      CloseAddCardToCollectionPage event, Emitter<AppState> emit) {
    emit(
      state.copyWith(isNavigationAddCardToCollection: false),
    );
  }

  void _onConnectionError(
    ConnectionError event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(connectionError: true));
  }

  void _onCleanConnectionError(
    CleanConnectionError event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(connectionError: false));
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
