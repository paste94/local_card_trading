import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scryfall_api/scryfall_api.dart';

part "selected_card_set.freezed.dart";

/// dart run build_runner build
///

@freezed
class SelectedCardSet with _$SelectedCardSet {
  const factory SelectedCardSet({
    required String name,
    required String collectorNumber,
    required List<Language> langList,
    required String code,
  }) = _SelectedCardSet;
}

// @freezed
// class SelectedCardSet with _$SelectedCardSet {
//   const SelectedCardSet._();
//   const factory SelectedCardSet({
//     required MtgSet mtgSet,
//     required String collectorNumber,
//   }) = _SelectedCardSet;

//   factory SelectedCardSet.fromMtgSet({
//     required MtgSet mtgSet,
//     required String collectorNumber,
//   }) =>
//       SelectedCardSet(
//         mtgSet: mtgSet,
//         collectorNumber: collectorNumber,
//       );

//   String get name => mtgSet.name;
//   String get code => mtgSet.code;
// }
