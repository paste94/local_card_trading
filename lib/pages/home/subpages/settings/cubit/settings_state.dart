part of 'settings_cubit.dart';

final class SettingsState extends Equatable {
  const SettingsState({
    this.currentPassword = const Password.pure(),
    this.newPassword = const Password.pure(),
    this.confirmNewPassword = const ConfirmedPassword.pure(),
    this.isValid = false,
  });

  final Password currentPassword;
  final Password newPassword;
  final ConfirmedPassword confirmNewPassword;
  final bool isValid;

  @override
  List<Object> get props =>
      [currentPassword, newPassword, confirmNewPassword, isValid];

  SettingsState copyWith({
    Password? currentPassword,
    Password? newPassword,
    ConfirmedPassword? confirmNewPassword,
    bool? isValid,
  }) {
    return SettingsState(
      currentPassword: currentPassword ?? this.currentPassword,
      newPassword: newPassword ?? this.newPassword,
      confirmNewPassword: confirmNewPassword ?? this.confirmNewPassword,
      isValid: isValid ?? this.isValid,
    );
  }
}
