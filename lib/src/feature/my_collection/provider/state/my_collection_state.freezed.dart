// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_collection_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyCollectionState {
  Iterable<MtgCard>? get searchCardList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyCollectionStateCopyWith<MyCollectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyCollectionStateCopyWith<$Res> {
  factory $MyCollectionStateCopyWith(
          MyCollectionState value, $Res Function(MyCollectionState) then) =
      _$MyCollectionStateCopyWithImpl<$Res, MyCollectionState>;
  @useResult
  $Res call({Iterable<MtgCard>? searchCardList});
}

/// @nodoc
class _$MyCollectionStateCopyWithImpl<$Res, $Val extends MyCollectionState>
    implements $MyCollectionStateCopyWith<$Res> {
  _$MyCollectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchCardList = freezed,
  }) {
    return _then(_value.copyWith(
      searchCardList: freezed == searchCardList
          ? _value.searchCardList
          : searchCardList // ignore: cast_nullable_to_non_nullable
              as Iterable<MtgCard>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyCollectionStateImplCopyWith<$Res>
    implements $MyCollectionStateCopyWith<$Res> {
  factory _$$MyCollectionStateImplCopyWith(_$MyCollectionStateImpl value,
          $Res Function(_$MyCollectionStateImpl) then) =
      __$$MyCollectionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Iterable<MtgCard>? searchCardList});
}

/// @nodoc
class __$$MyCollectionStateImplCopyWithImpl<$Res>
    extends _$MyCollectionStateCopyWithImpl<$Res, _$MyCollectionStateImpl>
    implements _$$MyCollectionStateImplCopyWith<$Res> {
  __$$MyCollectionStateImplCopyWithImpl(_$MyCollectionStateImpl _value,
      $Res Function(_$MyCollectionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchCardList = freezed,
  }) {
    return _then(_$MyCollectionStateImpl(
      searchCardList: freezed == searchCardList
          ? _value.searchCardList
          : searchCardList // ignore: cast_nullable_to_non_nullable
              as Iterable<MtgCard>?,
    ));
  }
}

/// @nodoc

class _$MyCollectionStateImpl implements _MyCollectionState {
  const _$MyCollectionStateImpl({this.searchCardList});

  @override
  final Iterable<MtgCard>? searchCardList;

  @override
  String toString() {
    return 'MyCollectionState(searchCardList: $searchCardList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyCollectionStateImpl &&
            const DeepCollectionEquality()
                .equals(other.searchCardList, searchCardList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(searchCardList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyCollectionStateImplCopyWith<_$MyCollectionStateImpl> get copyWith =>
      __$$MyCollectionStateImplCopyWithImpl<_$MyCollectionStateImpl>(
          this, _$identity);
}

abstract class _MyCollectionState implements MyCollectionState {
  const factory _MyCollectionState({final Iterable<MtgCard>? searchCardList}) =
      _$MyCollectionStateImpl;

  @override
  Iterable<MtgCard>? get searchCardList;
  @override
  @JsonKey(ignore: true)
  _$$MyCollectionStateImplCopyWith<_$MyCollectionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
