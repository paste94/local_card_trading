import 'package:formz/formz.dart';
import 'package:local_card_trading/src/core/widgets/email.dart';
import 'package:local_card_trading/src/core/widgets/password.dart';
import 'package:local_card_trading/src/feature/auth/providers/login/state/login_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@riverpod
class Login extends _$Login {
  @override
  LoginState build() {
    return const LoginState.initial();
  }

  void emailChanged(String email) {
    Email newEmail = Email.dirty(email);
    state = state.copyWith(
      email: newEmail,
      isValid: Formz.validate([newEmail, state.password]),
    );
  }

  void passwordChanged(String password) {
    Password newPassword = Password.dirty(password);
    state = state.copyWith(
      password: newPassword,
      isValid: Formz.validate([state.email, newPassword]),
    );
  }
}
