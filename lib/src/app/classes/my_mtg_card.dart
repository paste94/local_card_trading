import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:local_card_trading/src/app/enums/conditions_enum.dart';
import 'package:scryfall_api/scryfall_api.dart';

part "my_mtg_card.freezed.dart";

@freezed
class MyMtgCard with _$MyMtgCard {
  const MyMtgCard._();
  const factory MyMtgCard({
    required MtgCard mtgCard,
    @Default(Conditions.mint) Conditions conditions,
    @Default(1) int quantity,
    @Default(false) bool isFoil,
    @Default(Language.english) Language language,
    @Default('') String note,
  }) = _MyMtgCard;

  factory MyMtgCard.fromMtgCard(MtgCard mtgCard) => MyMtgCard(mtgCard: mtgCard);

  String get name => mtgCard.name;
  String get setName => mtgCard.setName;
  String get collectorNumber => mtgCard.collectorNumber;
  List<CardFace>? get cardFaces => mtgCard.cardFaces;
  ImageUris? get imageUris => mtgCard.imageUris;
  Language get lang => mtgCard.lang;
  bool get foil => mtgCard.foil;
  List<Finish> get finishes => mtgCard.finishes;
}
