part of 'app_bloc.dart';

sealed class AppEvent {
  const AppEvent();
}

final class AppLogoutRequested extends AppEvent {
  const AppLogoutRequested();
}

final class _AppUserChanged extends AppEvent {
  const _AppUserChanged(this.user);

  final User user;
}

final class AppUserUpdateName extends AppEvent {
  const AppUserUpdateName(this.newName);

  final String newName;
}

final class AppUserError extends AppEvent {
  const AppUserError(this.errorMsg);

  final String? errorMsg;
}

final class AppUserResetError extends AppEvent {
  const AppUserResetError();
}
