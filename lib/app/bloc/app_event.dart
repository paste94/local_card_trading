part of 'app_bloc.dart';

sealed class AppEvent {
  const AppEvent();
}

final class LogoutRequested extends AppEvent {
  const LogoutRequested();
}

final class _UserChanged extends AppEvent {
  const _UserChanged(this.user);

  final User user;
}

final class UserUpdateName extends AppEvent {
  UserUpdateName(this.newName, {required this.onSuccess});

  final String newName;
  final Function onSuccess;
}

final class UserUpdatePassword extends AppEvent {
  UserUpdatePassword(
    this.currentPassword,
    this.newPassword, {
    required this.onSuccess,
  });

  final String currentPassword;
  final String newPassword;
  final Function onSuccess;
}

final class UserUpdatePhoto extends AppEvent {
  UserUpdatePhoto(
    this.newPhoto,
  );

  final File newPhoto;
}

final class UserError extends AppEvent {
  const UserError(this.errorMsg);

  final String? errorMsg;
}

final class UserResetError extends AppEvent {
  const UserResetError();
}

final class AuthUserSetIsLoading extends AppEvent {
  const AuthUserSetIsLoading(this.isLoading);

  final bool isLoading;
}

final class AuthUserResetIsReauthRequired extends AppEvent {
  const AuthUserResetIsReauthRequired();
}

final class GoToAddCardToCollectionPage extends AppEvent {
  const GoToAddCardToCollectionPage();
}

final class GoToHomePage extends AppEvent {
  const GoToHomePage();
}

final class ConnectionError extends AppEvent {
  const ConnectionError();
}

final class CleanConnectionError extends AppEvent {
  const CleanConnectionError();
}
