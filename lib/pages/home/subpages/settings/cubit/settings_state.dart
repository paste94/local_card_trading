part of 'settings_cubit.dart';

final class SettingsState extends Equatable {
  const SettingsState({
    this.name = const Name.pure(),
    this.currentPassword = const Password.pure(),
    this.newPassword = const Password.pure(),
    this.confirmNewPassword = const ConfirmedPassword.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.isReauthRequired = false,
    this.errorMsg = '',
  });

  final Name name;
  final Password currentPassword;
  final Password newPassword;
  final ConfirmedPassword confirmNewPassword;
  final FormzSubmissionStatus status;
  final bool isValid;
  final bool isReauthRequired;
  final String errorMsg;

  @override
  List<Object> get props => [
        errorMsg,
      ];

  SettingsState copyWith({
    Name? name,
    Password? currentPassword,
    Password? newPassword,
    ConfirmedPassword? confirmNewPassword,
    FormzSubmissionStatus? status,
    bool? isValid,
    bool? isReauthRequired,
    String? errorMsg,
  }) {
    return SettingsState(
      name: name ?? this.name,
      currentPassword: currentPassword ?? this.currentPassword,
      newPassword: newPassword ?? this.newPassword,
      confirmNewPassword: confirmNewPassword ?? this.confirmNewPassword,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      isReauthRequired: isReauthRequired ?? this.isReauthRequired,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
}
