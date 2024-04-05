import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:local_card_trading/src/repository/card/scryfall_repository.dart';

part "my_collection_state.freezed.dart";

@freezed
class MyCollectionState with _$MyCollectionState {
  const factory MyCollectionState({
    Iterable<MtgCard>? searchCardList,
  }) = _MyCollectionState;
}
