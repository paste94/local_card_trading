import 'package:local_card_trading/src/app/classes/my_mtg_card.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scryfall_api/scryfall_api.dart';

part 'search_card_name_provider.g.dart';

final apiClient = ScryfallApiClient();

@riverpod
class SearchCardName extends _$SearchCardName {
  @override
  String build() {
    return '';
  }

  setState(String val) {
    state = val;
  }
}

@riverpod
Future<PaginableList<MyMtgCard>> fetchCards(ref) async {
  final cardName = ref.watch(searchCardNameProvider);
  if (cardName.isEmpty) {
    return PaginableList(data: [], hasMore: false);
  }
  final cardList = await apiClient.searchCards(cardName);
  final myCardList = PaginableList(
    data:
        cardList.data.map((card) => MyMtgCard.fromMtgCard(card: card)).toList(),
    hasMore: true,
  );
  return myCardList;
}
