import 'package:local_card_trading/src/app/classes/my_mtg_card.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scryfall_api/scryfall_api.dart';

part 'selected_card_provider.g.dart';

@riverpod
class SelectedCardName extends _$SelectedCardName {
  @override
  String? build() {
    return null;
  }

  void selectName(String selected) {
    state = selected;
  }

  void unselect() {
    state = null;
  }
}
