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
  AppUserUpdateName(this.newName, {required this.onSuccess});
  final String newName;
  final Function onSuccess;
}

final class AppUserError extends AppEvent {
  const AppUserError(this.errorMsg);
  final String? errorMsg;
}

final class AppUserResetError extends AppEvent {
  const AppUserResetError();
}
