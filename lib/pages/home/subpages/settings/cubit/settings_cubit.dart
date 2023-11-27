import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:local_card_trading/widgets/confirmed_password.dart';
import 'package:local_card_trading/widgets/name.dart';
import 'package:local_card_trading/widgets/password.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this._authenticationRepository) : super(const SettingsState());
  final AuthenticationRepository _authenticationRepository;

  void nameChanged(String name) {
    emit(state.copyWith(name: Name.dirty(name)));
  }

  void currentPasswordChanged(String value) {
    emit(
      state.copyWith(
        currentPassword: Password.dirty(value),
      ),
    );
  }

  void newPasswordChanged(String value) {
    Password newPassword = Password.dirty(value);
    ConfirmedPassword confirmNewPassword = ConfirmedPassword.dirty(
      password: newPassword.value,
      value: state.confirmNewPassword.value,
    );
    emit(
      state.copyWith(
        newPassword: newPassword,
        confirmNewPassword: confirmNewPassword,
        isValid: Formz.validate([
          newPassword,
          confirmNewPassword,
        ]),
      ),
    );
  }

  void confirmNewPasswordChanged(String value) {
    final confirmednewPassword = ConfirmedPassword.dirty(
      password: state.newPassword.value,
      value: value,
    );
    emit(
      state.copyWith(
        confirmNewPassword: confirmednewPassword,
        isValid: Formz.validate([
          state.newPassword,
          state.confirmNewPassword,
        ]),
      ),
    );
  }

  Future<void> changeNameFormSubmitted() async {
    if (!Formz.validate([state.name])) return;
    emit(state.copyWith(
      status: FormzSubmissionStatus.inProgress,
    ));
    try {
      await _authenticationRepository.updateUserName(state.name.value);
      emit(state.copyWith(
        status: FormzSubmissionStatus.initial,
      ));
    } on UpdateFailure catch (e) {
      emit(
        state.copyWith(
          errorMsg: e.message,
        ),
      );
    }
  }

  Future<void> changePasswordFormSubmitted() async {
    if (!state.isValid) return;
    emit(state.copyWith(
      status: FormzSubmissionStatus.inProgress,
    ));
    try {
      await _authenticationRepository.updatePassword(state.newPassword.value);
    } on UpdateFailure catch (e) {
      if (e.code == 'requires-recent-login') {
        emit(state.copyWith(
          isReauthRequired: true,
        ));
      } else {
        emit(state.copyWith(
          errorMsg: e.message,
        ));
      }
    }
  }

  void resetCubit() {
    emit(state.copyWith(
      currentPassword: const Password.pure(),
      newPassword: const Password.pure(),
      confirmNewPassword: const ConfirmedPassword.pure(),
      status: FormzSubmissionStatus.initial,
      isValid: false,
      isReauthRequired: false,
    ));
  }

  void resetError() {
    emit(state.copyWith(
      errorMsg: '',
    ));
  }
}
