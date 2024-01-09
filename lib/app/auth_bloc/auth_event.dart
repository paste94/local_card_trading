part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

final class AuthLogoutRequested extends AuthEvent {
  const AuthLogoutRequested();
}

final class _AuthUserChanged extends AuthEvent {
  const _AuthUserChanged(this.user);

  final User user;
}

final class AuthUserUpdateName extends AuthEvent {
  AuthUserUpdateName(this.newName, {required this.onSuccess});

  final String newName;
  final Function onSuccess;
}

final class AuthUserUpdatePassword extends AuthEvent {
  AuthUserUpdatePassword(
    this.currentPassword,
    this.newPassword, {
    required this.onSuccess,
  });

  final String currentPassword;
  final String newPassword;
  final Function onSuccess;
}

final class AuthUserUpdatePhoto extends AuthEvent {
  AuthUserUpdatePhoto(
    this.newPhoto,
  );

  final File newPhoto;
}

final class AuthUserError extends AuthEvent {
  const AuthUserError(this.errorMsg);

  final String? errorMsg;
}

final class AuthUserResetError extends AuthEvent {
  const AuthUserResetError();
}

final class AuthUserSetIsLoading extends AuthEvent {
  const AuthUserSetIsLoading(this.isLoading);

  final bool isLoading;
}

final class AuthUserResetIsReauthRequired extends AuthEvent {
  const AuthUserResetIsReauthRequired();
}
