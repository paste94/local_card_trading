import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:local_card_trading/src/app/models/my_mtg_card.dart';
import 'package:scryfall_api/scryfall_api.dart';

part "search_card_state.freezed.dart";

@freezed
class SearchCardState with _$SearchCardState {
  const factory SearchCardState({
    PaginableList<MyMtgCard>? searchCardList,
    @Default(false) bool loading,
  }) = _SearchCardState;
}
