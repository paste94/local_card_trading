import 'package:authentication_repository/authentication_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "authentication_state.freezed.dart";

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState({
    @Default(false) bool wannaRegister,
    @Default(false) bool loading,
    User? user,
  }) = _AuthenticationState;
}
