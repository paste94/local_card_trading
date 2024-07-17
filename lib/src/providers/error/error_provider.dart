import 'package:local_card_trading/src/providers/error/state/error_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'error_provider.g.dart';

@riverpod
class Error extends _$Error {
  @override
  ErrorState build() {
    return const ErrorState();
  }

  Future<void> setError({
    required String error,
  }) async {
    state = state.copyWith(
      error: error,
    );
  }

  void dismissError() {
    state = state.copyWith(
      error: null,
    );
  }
}
