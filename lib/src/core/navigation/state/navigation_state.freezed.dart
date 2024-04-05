// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navigation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NavigationState {
  bool get wannaRegister => throw _privateConstructorUsedError;
  bool get isAddCardPageOpen => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NavigationStateCopyWith<NavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationStateCopyWith<$Res> {
  factory $NavigationStateCopyWith(
          NavigationState value, $Res Function(NavigationState) then) =
      _$NavigationStateCopyWithImpl<$Res, NavigationState>;
  @useResult
  $Res call(
      {bool wannaRegister,
      bool isAddCardPageOpen,
      bool loading,
      User? user,
      String? error});
}

/// @nodoc
class _$NavigationStateCopyWithImpl<$Res, $Val extends NavigationState>
    implements $NavigationStateCopyWith<$Res> {
  _$NavigationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wannaRegister = null,
    Object? isAddCardPageOpen = null,
    Object? loading = null,
    Object? user = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      wannaRegister: null == wannaRegister
          ? _value.wannaRegister
          : wannaRegister // ignore: cast_nullable_to_non_nullable
              as bool,
      isAddCardPageOpen: null == isAddCardPageOpen
          ? _value.isAddCardPageOpen
          : isAddCardPageOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NavigationStateImplCopyWith<$Res>
    implements $NavigationStateCopyWith<$Res> {
  factory _$$NavigationStateImplCopyWith(_$NavigationStateImpl value,
          $Res Function(_$NavigationStateImpl) then) =
      __$$NavigationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool wannaRegister,
      bool isAddCardPageOpen,
      bool loading,
      User? user,
      String? error});
}

/// @nodoc
class __$$NavigationStateImplCopyWithImpl<$Res>
    extends _$NavigationStateCopyWithImpl<$Res, _$NavigationStateImpl>
    implements _$$NavigationStateImplCopyWith<$Res> {
  __$$NavigationStateImplCopyWithImpl(
      _$NavigationStateImpl _value, $Res Function(_$NavigationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wannaRegister = null,
    Object? isAddCardPageOpen = null,
    Object? loading = null,
    Object? user = freezed,
    Object? error = freezed,
  }) {
    return _then(_$NavigationStateImpl(
      wannaRegister: null == wannaRegister
          ? _value.wannaRegister
          : wannaRegister // ignore: cast_nullable_to_non_nullable
              as bool,
      isAddCardPageOpen: null == isAddCardPageOpen
          ? _value.isAddCardPageOpen
          : isAddCardPageOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NavigationStateImpl implements _NavigationState {
  const _$NavigationStateImpl(
      {this.wannaRegister = false,
      this.isAddCardPageOpen = false,
      this.loading = false,
      this.user,
      this.error});

  @override
  @JsonKey()
  final bool wannaRegister;
  @override
  @JsonKey()
  final bool isAddCardPageOpen;
  @override
  @JsonKey()
  final bool loading;
  @override
  final User? user;
  @override
  final String? error;

  @override
  String toString() {
    return 'NavigationState(wannaRegister: $wannaRegister, isAddCardPageOpen: $isAddCardPageOpen, loading: $loading, user: $user, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavigationStateImpl &&
            (identical(other.wannaRegister, wannaRegister) ||
                other.wannaRegister == wannaRegister) &&
            (identical(other.isAddCardPageOpen, isAddCardPageOpen) ||
                other.isAddCardPageOpen == isAddCardPageOpen) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, wannaRegister, isAddCardPageOpen, loading, user, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NavigationStateImplCopyWith<_$NavigationStateImpl> get copyWith =>
      __$$NavigationStateImplCopyWithImpl<_$NavigationStateImpl>(
          this, _$identity);
}

abstract class _NavigationState implements NavigationState {
  const factory _NavigationState(
      {final bool wannaRegister,
      final bool isAddCardPageOpen,
      final bool loading,
      final User? user,
      final String? error}) = _$NavigationStateImpl;

  @override
  bool get wannaRegister;
  @override
  bool get isAddCardPageOpen;
  @override
  bool get loading;
  @override
  User? get user;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$NavigationStateImplCopyWith<_$NavigationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
