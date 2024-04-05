// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mtg_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MtgCard _$MtgCardFromJson(Map<String, dynamic> json) {
  return _MtgCard.fromJson(json);
}

/// @nodoc
mixin _$MtgCard {
  String? get id => throw _privateConstructorUsedError;
  String? get lang => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get setName => throw _privateConstructorUsedError;
  List<Uri>? get imageUri => throw _privateConstructorUsedError;
  List<Uri>? get imageUriSmall => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MtgCardCopyWith<MtgCard> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MtgCardCopyWith<$Res> {
  factory $MtgCardCopyWith(MtgCard value, $Res Function(MtgCard) then) =
      _$MtgCardCopyWithImpl<$Res, MtgCard>;
  @useResult
  $Res call(
      {String? id,
      String? lang,
      String? name,
      String? setName,
      List<Uri>? imageUri,
      List<Uri>? imageUriSmall});
}

/// @nodoc
class _$MtgCardCopyWithImpl<$Res, $Val extends MtgCard>
    implements $MtgCardCopyWith<$Res> {
  _$MtgCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? lang = freezed,
    Object? name = freezed,
    Object? setName = freezed,
    Object? imageUri = freezed,
    Object? imageUriSmall = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      lang: freezed == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      setName: freezed == setName
          ? _value.setName
          : setName // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUri: freezed == imageUri
          ? _value.imageUri
          : imageUri // ignore: cast_nullable_to_non_nullable
              as List<Uri>?,
      imageUriSmall: freezed == imageUriSmall
          ? _value.imageUriSmall
          : imageUriSmall // ignore: cast_nullable_to_non_nullable
              as List<Uri>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MtgCardImplCopyWith<$Res> implements $MtgCardCopyWith<$Res> {
  factory _$$MtgCardImplCopyWith(
          _$MtgCardImpl value, $Res Function(_$MtgCardImpl) then) =
      __$$MtgCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? lang,
      String? name,
      String? setName,
      List<Uri>? imageUri,
      List<Uri>? imageUriSmall});
}

/// @nodoc
class __$$MtgCardImplCopyWithImpl<$Res>
    extends _$MtgCardCopyWithImpl<$Res, _$MtgCardImpl>
    implements _$$MtgCardImplCopyWith<$Res> {
  __$$MtgCardImplCopyWithImpl(
      _$MtgCardImpl _value, $Res Function(_$MtgCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? lang = freezed,
    Object? name = freezed,
    Object? setName = freezed,
    Object? imageUri = freezed,
    Object? imageUriSmall = freezed,
  }) {
    return _then(_$MtgCardImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      lang: freezed == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      setName: freezed == setName
          ? _value.setName
          : setName // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUri: freezed == imageUri
          ? _value._imageUri
          : imageUri // ignore: cast_nullable_to_non_nullable
              as List<Uri>?,
      imageUriSmall: freezed == imageUriSmall
          ? _value._imageUriSmall
          : imageUriSmall // ignore: cast_nullable_to_non_nullable
              as List<Uri>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MtgCardImpl implements _MtgCard {
  _$MtgCardImpl(
      {this.id,
      this.lang,
      this.name,
      this.setName,
      final List<Uri>? imageUri,
      final List<Uri>? imageUriSmall})
      : _imageUri = imageUri,
        _imageUriSmall = imageUriSmall;

  factory _$MtgCardImpl.fromJson(Map<String, dynamic> json) =>
      _$$MtgCardImplFromJson(json);

  @override
  final String? id;
  @override
  final String? lang;
  @override
  final String? name;
  @override
  final String? setName;
  final List<Uri>? _imageUri;
  @override
  List<Uri>? get imageUri {
    final value = _imageUri;
    if (value == null) return null;
    if (_imageUri is EqualUnmodifiableListView) return _imageUri;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Uri>? _imageUriSmall;
  @override
  List<Uri>? get imageUriSmall {
    final value = _imageUriSmall;
    if (value == null) return null;
    if (_imageUriSmall is EqualUnmodifiableListView) return _imageUriSmall;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MtgCard(id: $id, lang: $lang, name: $name, setName: $setName, imageUri: $imageUri, imageUriSmall: $imageUriSmall)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MtgCardImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.setName, setName) || other.setName == setName) &&
            const DeepCollectionEquality().equals(other._imageUri, _imageUri) &&
            const DeepCollectionEquality()
                .equals(other._imageUriSmall, _imageUriSmall));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      lang,
      name,
      setName,
      const DeepCollectionEquality().hash(_imageUri),
      const DeepCollectionEquality().hash(_imageUriSmall));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MtgCardImplCopyWith<_$MtgCardImpl> get copyWith =>
      __$$MtgCardImplCopyWithImpl<_$MtgCardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MtgCardImplToJson(
      this,
    );
  }
}

abstract class _MtgCard implements MtgCard {
  factory _MtgCard(
      {final String? id,
      final String? lang,
      final String? name,
      final String? setName,
      final List<Uri>? imageUri,
      final List<Uri>? imageUriSmall}) = _$MtgCardImpl;

  factory _MtgCard.fromJson(Map<String, dynamic> json) = _$MtgCardImpl.fromJson;

  @override
  String? get id;
  @override
  String? get lang;
  @override
  String? get name;
  @override
  String? get setName;
  @override
  List<Uri>? get imageUri;
  @override
  List<Uri>? get imageUriSmall;
  @override
  @JsonKey(ignore: true)
  _$$MtgCardImplCopyWith<_$MtgCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
