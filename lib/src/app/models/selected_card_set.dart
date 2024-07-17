import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scryfall_api/scryfall_api.dart';

part "selected_card_set.freezed.dart";

/// dart run build_runner build
@freezed
class SelectedCardSet with _$SelectedCardSet {
  const factory SelectedCardSet({
    required String name,
    required String collectorNumber,
    required List<Language> langList,
    required String code,
  }) = _SelectedCardSet;
}
