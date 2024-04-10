// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_card_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchCardState {
  PaginableList<MyMtgCard>? get searchCardList =>
      throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchCardStateCopyWith<SearchCardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchCardStateCopyWith<$Res> {
  factory $SearchCardStateCopyWith(
          SearchCardState value, $Res Function(SearchCardState) then) =
      _$SearchCardStateCopyWithImpl<$Res, SearchCardState>;
  @useResult
  $Res call({PaginableList<MyMtgCard>? searchCardList, bool loading});
}

/// @nodoc
class _$SearchCardStateCopyWithImpl<$Res, $Val extends SearchCardState>
    implements $SearchCardStateCopyWith<$Res> {
  _$SearchCardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchCardList = freezed,
    Object? loading = null,
  }) {
    return _then(_value.copyWith(
      searchCardList: freezed == searchCardList
          ? _value.searchCardList
          : searchCardList // ignore: cast_nullable_to_non_nullable
              as PaginableList<MyMtgCard>?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchCardStateImplCopyWith<$Res>
    implements $SearchCardStateCopyWith<$Res> {
  factory _$$SearchCardStateImplCopyWith(_$SearchCardStateImpl value,
          $Res Function(_$SearchCardStateImpl) then) =
      __$$SearchCardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PaginableList<MyMtgCard>? searchCardList, bool loading});
}

/// @nodoc
class __$$SearchCardStateImplCopyWithImpl<$Res>
    extends _$SearchCardStateCopyWithImpl<$Res, _$SearchCardStateImpl>
    implements _$$SearchCardStateImplCopyWith<$Res> {
  __$$SearchCardStateImplCopyWithImpl(
      _$SearchCardStateImpl _value, $Res Function(_$SearchCardStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchCardList = freezed,
    Object? loading = null,
  }) {
    return _then(_$SearchCardStateImpl(
      searchCardList: freezed == searchCardList
          ? _value.searchCardList
          : searchCardList // ignore: cast_nullable_to_non_nullable
              as PaginableList<MyMtgCard>?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SearchCardStateImpl implements _SearchCardState {
  const _$SearchCardStateImpl({this.searchCardList, this.loading = false});

  @override
  final PaginableList<MyMtgCard>? searchCardList;
  @override
  @JsonKey()
  final bool loading;

  @override
  String toString() {
    return 'SearchCardState(searchCardList: $searchCardList, loading: $loading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchCardStateImpl &&
            (identical(other.searchCardList, searchCardList) ||
                other.searchCardList == searchCardList) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchCardList, loading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchCardStateImplCopyWith<_$SearchCardStateImpl> get copyWith =>
      __$$SearchCardStateImplCopyWithImpl<_$SearchCardStateImpl>(
          this, _$identity);
}

abstract class _SearchCardState implements SearchCardState {
  const factory _SearchCardState(
      {final PaginableList<MyMtgCard>? searchCardList,
      final bool loading}) = _$SearchCardStateImpl;

  @override
  PaginableList<MyMtgCard>? get searchCardList;
  @override
  bool get loading;
  @override
  @JsonKey(ignore: true)
  _$$SearchCardStateImplCopyWith<_$SearchCardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
