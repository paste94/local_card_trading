// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mtg_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MtgCardImpl _$$MtgCardImplFromJson(Map<String, dynamic> json) =>
    _$MtgCardImpl(
      id: json['id'] as String?,
      lang: json['lang'] as String?,
      name: json['name'] as String?,
      setName: json['setName'] as String?,
      imageUri: (json['imageUri'] as List<dynamic>?)
          ?.map((e) => Uri.parse(e as String))
          .toList(),
      imageUriSmall: (json['imageUriSmall'] as List<dynamic>?)
          ?.map((e) => Uri.parse(e as String))
          .toList(),
    );

Map<String, dynamic> _$$MtgCardImplToJson(_$MtgCardImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lang': instance.lang,
      'name': instance.name,
      'setName': instance.setName,
      'imageUri': instance.imageUri?.map((e) => e.toString()).toList(),
      'imageUriSmall':
          instance.imageUriSmall?.map((e) => e.toString()).toList(),
    };
