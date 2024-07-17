// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_mtg_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyMtgCard {
  MtgCard get mtgCard => throw _privateConstructorUsedError;
  Finish get finish => throw _privateConstructorUsedError;
  List<SelectedCardSet> get setList => throw _privateConstructorUsedError;
  Conditions get conditions => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  Language get language => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyMtgCardCopyWith<MyMtgCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyMtgCardCopyWith<$Res> {
  factory $MyMtgCardCopyWith(MyMtgCard value, $Res Function(MyMtgCard) then) =
      _$MyMtgCardCopyWithImpl<$Res, MyMtgCard>;
  @useResult
  $Res call(
      {MtgCard mtgCard,
      Finish finish,
      List<SelectedCardSet> setList,
      Conditions conditions,
      int quantity,
      Language language,
      String? note});
}

/// @nodoc
class _$MyMtgCardCopyWithImpl<$Res, $Val extends MyMtgCard>
    implements $MyMtgCardCopyWith<$Res> {
  _$MyMtgCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mtgCard = null,
    Object? finish = null,
    Object? setList = null,
    Object? conditions = null,
    Object? quantity = null,
    Object? language = null,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      mtgCard: null == mtgCard
          ? _value.mtgCard
          : mtgCard // ignore: cast_nullable_to_non_nullable
              as MtgCard,
      finish: null == finish
          ? _value.finish
          : finish // ignore: cast_nullable_to_non_nullable
              as Finish,
      setList: null == setList
          ? _value.setList
          : setList // ignore: cast_nullable_to_non_nullable
              as List<SelectedCardSet>,
      conditions: null == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as Conditions,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Language,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyMtgCardImplCopyWith<$Res>
    implements $MyMtgCardCopyWith<$Res> {
  factory _$$MyMtgCardImplCopyWith(
          _$MyMtgCardImpl value, $Res Function(_$MyMtgCardImpl) then) =
      __$$MyMtgCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MtgCard mtgCard,
      Finish finish,
      List<SelectedCardSet> setList,
      Conditions conditions,
      int quantity,
      Language language,
      String? note});
}

/// @nodoc
class __$$MyMtgCardImplCopyWithImpl<$Res>
    extends _$MyMtgCardCopyWithImpl<$Res, _$MyMtgCardImpl>
    implements _$$MyMtgCardImplCopyWith<$Res> {
  __$$MyMtgCardImplCopyWithImpl(
      _$MyMtgCardImpl _value, $Res Function(_$MyMtgCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mtgCard = null,
    Object? finish = null,
    Object? setList = null,
    Object? conditions = null,
    Object? quantity = null,
    Object? language = null,
    Object? note = freezed,
  }) {
    return _then(_$MyMtgCardImpl(
      mtgCard: null == mtgCard
          ? _value.mtgCard
          : mtgCard // ignore: cast_nullable_to_non_nullable
              as MtgCard,
      finish: null == finish
          ? _value.finish
          : finish // ignore: cast_nullable_to_non_nullable
              as Finish,
      setList: null == setList
          ? _value._setList
          : setList // ignore: cast_nullable_to_non_nullable
              as List<SelectedCardSet>,
      conditions: null == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as Conditions,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Language,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MyMtgCardImpl extends _MyMtgCard {
  _$MyMtgCardImpl(
      {required this.mtgCard,
      required this.finish,
      final List<SelectedCardSet> setList = const [],
      this.conditions = Conditions.mint,
      this.quantity = 1,
      this.language = Language.english,
      this.note})
      : _setList = setList,
        super._();

  @override
  final MtgCard mtgCard;
  @override
  final Finish finish;
  final List<SelectedCardSet> _setList;
  @override
  @JsonKey()
  List<SelectedCardSet> get setList {
    if (_setList is EqualUnmodifiableListView) return _setList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_setList);
  }

  @override
  @JsonKey()
  final Conditions conditions;
  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey()
  final Language language;
  @override
  final String? note;

  @override
  String toString() {
    return 'MyMtgCard(mtgCard: $mtgCard, finish: $finish, setList: $setList, conditions: $conditions, quantity: $quantity, language: $language, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyMtgCardImpl &&
            (identical(other.mtgCard, mtgCard) || other.mtgCard == mtgCard) &&
            (identical(other.finish, finish) || other.finish == finish) &&
            const DeepCollectionEquality().equals(other._setList, _setList) &&
            (identical(other.conditions, conditions) ||
                other.conditions == conditions) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      mtgCard,
      finish,
      const DeepCollectionEquality().hash(_setList),
      conditions,
      quantity,
      language,
      note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyMtgCardImplCopyWith<_$MyMtgCardImpl> get copyWith =>
      __$$MyMtgCardImplCopyWithImpl<_$MyMtgCardImpl>(this, _$identity);
}

abstract class _MyMtgCard extends MyMtgCard {
  factory _MyMtgCard(
      {required final MtgCard mtgCard,
      required final Finish finish,
      final List<SelectedCardSet> setList,
      final Conditions conditions,
      final int quantity,
      final Language language,
      final String? note}) = _$MyMtgCardImpl;
  _MyMtgCard._() : super._();

  @override
  MtgCard get mtgCard;
  @override
  Finish get finish;
  @override
  List<SelectedCardSet> get setList;
  @override
  Conditions get conditions;
  @override
  int get quantity;
  @override
  Language get language;
  @override
  String? get note;
  @override
  @JsonKey(ignore: true)
  _$$MyMtgCardImplCopyWith<_$MyMtgCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
