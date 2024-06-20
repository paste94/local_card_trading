import 'package:authentication_repository/authentication_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "navigation_state.freezed.dart";

@freezed
class NavigationState with _$NavigationState {
  const factory NavigationState({
    @Default(false) bool wannaRegister,
    @Default(false) bool isAddCardPageOpen,
    String? fullScreenImage,
    User? user,
  }) = _NavigationState;
}
