import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/app/classes/my_mtg_card.dart';
import 'package:local_card_trading/src/core/navigation/navigation_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scryfall_api/scryfall_api.dart';

part 'search_card_provider.g.dart';

final apiClient = ScryfallApiClient();

final fetchCards = FutureProvider.autoDispose
    .family<PaginableList<MyMtgCard>, String>((ref, cardName) async {
  final cardList = await apiClient.searchCards(cardName);
  final myCardList = PaginableList(
    data:
        cardList.data.map((card) => MyMtgCard.fromMtgCard(card: card)).toList(),
    hasMore: true,
  );
  return myCardList;
});

@riverpod
class SelectedCard extends _$SelectedCard {
  @override
  String? build() {
    return null;
  }

  void select(String selected) {
    state = selected;
  }

  void unselect() {
    state = null;
  }
}
