import 'package:local_card_trading/src/app/classes/my_mtg_card.dart';
import 'package:local_card_trading/src/feature/my_collection/provider/state/search_card_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scryfall_api/scryfall_api.dart';

part 'search_card_provider.g.dart';

final apiClient = ScryfallApiClient();

@riverpod
class SearchCard extends _$SearchCard {
  @override
  SearchCardState build() {
    return const SearchCardState();
  }

  Future<void> search({
    required String cardName,
  }) async {
    state = state.copyWith(loading: true);
    final cardList = await apiClient.searchCards(cardName);
    final myCardList = PaginableList(
      data: cardList.data
          .map((card) => MyMtgCard.fromMtgCard(card: card))
          .toList(),
      hasMore: true,
    );
    state = state.copyWith(loading: true, searchCardList: myCardList);
  }
}
