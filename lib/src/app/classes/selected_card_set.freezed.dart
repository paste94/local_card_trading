// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selected_card_set.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SelectedCardSet {
  String get name => throw _privateConstructorUsedError;
  String get collectorNumber => throw _privateConstructorUsedError;
  List<Language> get langList => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectedCardSetCopyWith<SelectedCardSet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedCardSetCopyWith<$Res> {
  factory $SelectedCardSetCopyWith(
          SelectedCardSet value, $Res Function(SelectedCardSet) then) =
      _$SelectedCardSetCopyWithImpl<$Res, SelectedCardSet>;
  @useResult
  $Res call(
      {String name,
      String collectorNumber,
      List<Language> langList,
      String code});
}

/// @nodoc
class _$SelectedCardSetCopyWithImpl<$Res, $Val extends SelectedCardSet>
    implements $SelectedCardSetCopyWith<$Res> {
  _$SelectedCardSetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? collectorNumber = null,
    Object? langList = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      collectorNumber: null == collectorNumber
          ? _value.collectorNumber
          : collectorNumber // ignore: cast_nullable_to_non_nullable
              as String,
      langList: null == langList
          ? _value.langList
          : langList // ignore: cast_nullable_to_non_nullable
              as List<Language>,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectedCardSetImplCopyWith<$Res>
    implements $SelectedCardSetCopyWith<$Res> {
  factory _$$SelectedCardSetImplCopyWith(_$SelectedCardSetImpl value,
          $Res Function(_$SelectedCardSetImpl) then) =
      __$$SelectedCardSetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String collectorNumber,
      List<Language> langList,
      String code});
}

/// @nodoc
class __$$SelectedCardSetImplCopyWithImpl<$Res>
    extends _$SelectedCardSetCopyWithImpl<$Res, _$SelectedCardSetImpl>
    implements _$$SelectedCardSetImplCopyWith<$Res> {
  __$$SelectedCardSetImplCopyWithImpl(
      _$SelectedCardSetImpl _value, $Res Function(_$SelectedCardSetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? collectorNumber = null,
    Object? langList = null,
    Object? code = null,
  }) {
    return _then(_$SelectedCardSetImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      collectorNumber: null == collectorNumber
          ? _value.collectorNumber
          : collectorNumber // ignore: cast_nullable_to_non_nullable
              as String,
      langList: null == langList
          ? _value._langList
          : langList // ignore: cast_nullable_to_non_nullable
              as List<Language>,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SelectedCardSetImpl implements _SelectedCardSet {
  const _$SelectedCardSetImpl(
      {required this.name,
      required this.collectorNumber,
      required final List<Language> langList,
      required this.code})
      : _langList = langList;

  @override
  final String name;
  @override
  final String collectorNumber;
  final List<Language> _langList;
  @override
  List<Language> get langList {
    if (_langList is EqualUnmodifiableListView) return _langList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_langList);
  }

  @override
  final String code;

  @override
  String toString() {
    return 'SelectedCardSet(name: $name, collectorNumber: $collectorNumber, langList: $langList, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedCardSetImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.collectorNumber, collectorNumber) ||
                other.collectorNumber == collectorNumber) &&
            const DeepCollectionEquality().equals(other._langList, _langList) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, collectorNumber,
      const DeepCollectionEquality().hash(_langList), code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedCardSetImplCopyWith<_$SelectedCardSetImpl> get copyWith =>
      __$$SelectedCardSetImplCopyWithImpl<_$SelectedCardSetImpl>(
          this, _$identity);
}

abstract class _SelectedCardSet implements SelectedCardSet {
  const factory _SelectedCardSet(
      {required final String name,
      required final String collectorNumber,
      required final List<Language> langList,
      required final String code}) = _$SelectedCardSetImpl;

  @override
  String get name;
  @override
  String get collectorNumber;
  @override
  List<Language> get langList;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$SelectedCardSetImplCopyWith<_$SelectedCardSetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
