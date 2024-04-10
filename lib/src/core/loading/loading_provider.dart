import 'package:local_card_trading/src/core/loading/state/loading_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'loading_provider.g.dart';

@riverpod
class Loading extends _$Loading {
  @override
  LoadingState build() {
    return const LoadingState();
  }

  Future<void> setLoading(bool val) async {
    state = state.copyWith(loading: val);
  }
}
