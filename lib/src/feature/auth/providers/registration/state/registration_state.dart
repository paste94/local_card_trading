import 'package:flutter/foundation.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:local_card_trading/src/core/widgets/confirmed_password.dart';
import 'package:local_card_trading/src/core/widgets/email.dart';
import 'package:local_card_trading/src/core/widgets/password.dart';

part 'registration_state.freezed.dart';

@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState({
    @Default(Email.pure()) Email email,
    @Default(Password.pure()) Password password,
    @Default(ConfirmedPassword.pure()) ConfirmedPassword confirmedPassword,
    @Default(false) bool isValid,
    @Default(false) bool isThisPageOpened,
  }) = _RegistrationState;
}
