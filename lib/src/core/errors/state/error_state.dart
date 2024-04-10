import 'package:authentication_repository/authentication_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "error_state.freezed.dart";

@freezed
class ErrorState with _$ErrorState {
  const factory ErrorState({
    String? error,
  }) = _ErrorState;
}
