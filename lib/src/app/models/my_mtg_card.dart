import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:local_card_trading/src/app/models/selected_card_set.dart';
import 'package:local_card_trading/src/constants/enums/conditions_enum.dart';
import 'package:scryfall_api/scryfall_api.dart';

part "my_mtg_card.freezed.dart";

/// dart run build_runner build
@freezed
class MyMtgCard with _$MyMtgCard {
  const MyMtgCard._();
  factory MyMtgCard({
    required MtgCard mtgCard,
    required Finish finish,
    @Default([]) List<SelectedCardSet> setList,
    @Default(Conditions.mint) Conditions conditions,
    @Default(1) int quantity,
    @Default(Language.english) Language language,
    String? note,
  }) = _MyMtgCard;

  factory MyMtgCard.fromMtgCard({
    required MtgCard mtgCard,
    List<SelectedCardSet> setList = const [],
    List<Language> languageList = const [],
  }) =>
      MyMtgCard(
        mtgCard: mtgCard,
        setList: setList,
        finish: mtgCard.finishes[0],
      );

  String get id => mtgCard.id;
  String get name => mtgCard.name;
  String get setName => mtgCard.setName;
  String get collectorNumber => mtgCard.collectorNumber;
  List<CardFace>? get cardFaces => mtgCard.cardFaces;
  ImageUris? get imageUris => mtgCard.imageUris;
  Language get lang => mtgCard.lang;
  bool get foil => mtgCard.foil;
  List<Finish> get finishes => mtgCard.finishes;
  BorderColor get borderColor => mtgCard.borderColor;
  String get set => mtgCard.set;
  SelectedCardSet? get selectedSet => setList
      .where((set) =>
          set.name == setName && set.collectorNumber == collectorNumber)
      .toList()[0];

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'name': name,
      'set': set,
      'finish': finish.name,
      'conditions': conditions.name,
      'quantity': quantity,
      if (note != null) 'note': note,
    };
  }
}
