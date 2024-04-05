/// https://scryfall.com/docs/api/cards
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mtg_card.freezed.dart';
part 'mtg_card.g.dart';

@freezed
class MtgCard with _$MtgCard {
  factory MtgCard({
    String? id,
    String? lang,
    String? name,
    String? setName,
    List<Uri>? imageUri,
    List<Uri>? imageUriSmall,
  }) = _MtgCard;

  factory MtgCard.fromJson(Map<String, Object?> json) =>
      _$MtgCardFromJson(json);
}
