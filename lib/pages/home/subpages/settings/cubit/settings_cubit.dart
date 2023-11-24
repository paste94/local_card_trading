import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:local_card_trading/widgets/confirmed_password.dart';
import 'package:local_card_trading/widgets/password.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState());

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
}
