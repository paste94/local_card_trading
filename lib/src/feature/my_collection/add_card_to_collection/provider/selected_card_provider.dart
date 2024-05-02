import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/app/classes/my_mtg_card.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scryfall_api/scryfall_api.dart';

part 'selected_card_provider.g.dart';

final apiClient = ScryfallApiClient();

@riverpod
class SelectedCardIndex extends _$SelectedCardIndex {
  @override
  int build() {
    return 0;
  }

  void set(int val) {
    state = val;
  }
}

@riverpod
class SelectedCard extends _$SelectedCard {
  @override
  MyMtgCard? build() {
    return ref.watch(selectedCardNameProvider)?[0];
  }

  void set(MyMtgCard? card) {
    state = card;
  }
}

@riverpod
class SelectedCardName extends _$SelectedCardName {
  @override
  PaginableList<MyMtgCard>? build() {
    return null;
  }

  void selectName(String selectedCardName) async {
    final cardList = await apiClient.searchCards(
      selectedCardName,
      rollupMode: RollupMode.prints,
    );
    final myCardList = PaginableList(
      data: cardList.data
          .map((card) => MyMtgCard.fromMtgCard(card: card))
          .toList(),
      hasMore: true,
    );
    state = myCardList;
  }

  void unselect() {
    state = null;
  }
}

@riverpod
getSet(Ref ref, String id) async {
  final set = await apiClient.getSetById(id);
  return set;
}
