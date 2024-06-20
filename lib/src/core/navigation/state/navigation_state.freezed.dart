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
  String? get fullScreenImage => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;

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
      String? fullScreenImage,
      User? user});
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
    Object? fullScreenImage = freezed,
    Object? user = freezed,
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
      fullScreenImage: freezed == fullScreenImage
          ? _value.fullScreenImage
          : fullScreenImage // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
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
      String? fullScreenImage,
      User? user});
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
    Object? fullScreenImage = freezed,
    Object? user = freezed,
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
      fullScreenImage: freezed == fullScreenImage
          ? _value.fullScreenImage
          : fullScreenImage // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$NavigationStateImpl implements _NavigationState {
  const _$NavigationStateImpl(
      {this.wannaRegister = false,
      this.isAddCardPageOpen = false,
      this.fullScreenImage,
      this.user});

  @override
  @JsonKey()
  final bool wannaRegister;
  @override
  @JsonKey()
  final bool isAddCardPageOpen;
  @override
  final String? fullScreenImage;
  @override
  final User? user;

  @override
  String toString() {
    return 'NavigationState(wannaRegister: $wannaRegister, isAddCardPageOpen: $isAddCardPageOpen, fullScreenImage: $fullScreenImage, user: $user)';
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
            (identical(other.fullScreenImage, fullScreenImage) ||
                other.fullScreenImage == fullScreenImage) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, wannaRegister, isAddCardPageOpen, fullScreenImage, user);

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
      final String? fullScreenImage,
      final User? user}) = _$NavigationStateImpl;

  @override
  bool get wannaRegister;
  @override
  bool get isAddCardPageOpen;
  @override
  String? get fullScreenImage;
  @override
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$$NavigationStateImplCopyWith<_$NavigationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
