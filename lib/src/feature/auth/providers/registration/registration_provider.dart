import 'package:formz/formz.dart';
import 'package:local_card_trading/src/core/widgets/email.dart';
import 'package:local_card_trading/src/core/widgets/password.dart';
import 'package:local_card_trading/src/feature/auth/providers/registration/state/registration_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'registration_provider.g.dart';

@riverpod
class Registration extends _$Registration {
  @override
  RegistrationState build() {
    return const RegistrationState();
  }

  void clear() {
    state = const RegistrationState();
  }

  void emailChanged(String email) {
    Email newEmail = Email.dirty(email);
    state = state.copyWith(
      email: newEmail,
      isValid: Formz.validate([
        newEmail,
        state.password,
        state.confirmedPassword,
      ]),
    );
  }

  void passwordChanged(String password) {
    Password newPassword = Password.dirty(password);
    state = state.copyWith(
      password: newPassword,
      isValid: Formz.validate([
        state.email,
        newPassword,
        state.confirmedPassword,
      ]),
    );
  }

  void confirmetPasswordChanged(String password) {
    Password newPassword = Password.dirty(password);
    state = state.copyWith(
      password: newPassword,
      isValid: Formz.validate([
        state.email,
        newPassword,
        state.confirmedPassword,
      ]),
    );
  }
}
