import 'package:authentication_repository/authentication_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "authentication_state.freezed.dart";

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.login() = _Login;
  const factory AuthenticationState.register() = _Register;

  const factory AuthenticationState.loading() = _Loading;

  const factory AuthenticationState.authenticated({required User user}) =
      _Authenticated;
}
