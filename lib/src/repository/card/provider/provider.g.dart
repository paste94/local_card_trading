// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCardsFromNameHash() => r'283c8d2951338a3559edc696b7cd2c1e9581d3f0';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getCardsFromName].
@ProviderFor(getCardsFromName)
const getCardsFromNameProvider = GetCardsFromNameFamily();

/// See also [getCardsFromName].
class GetCardsFromNameFamily extends Family<AsyncValue<Iterable<MtgCard>>> {
  /// See also [getCardsFromName].
  const GetCardsFromNameFamily();

  /// See also [getCardsFromName].
  GetCardsFromNameProvider call(
    String cardName,
  ) {
    return GetCardsFromNameProvider(
      cardName,
    );
  }

  @override
  GetCardsFromNameProvider getProviderOverride(
    covariant GetCardsFromNameProvider provider,
  ) {
    return call(
      provider.cardName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getCardsFromNameProvider';
}

/// See also [getCardsFromName].
class GetCardsFromNameProvider
    extends AutoDisposeFutureProvider<Iterable<MtgCard>> {
  /// See also [getCardsFromName].
  GetCardsFromNameProvider(
    String cardName,
  ) : this._internal(
          (ref) => getCardsFromName(
            ref as GetCardsFromNameRef,
            cardName,
          ),
          from: getCardsFromNameProvider,
          name: r'getCardsFromNameProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCardsFromNameHash,
          dependencies: GetCardsFromNameFamily._dependencies,
          allTransitiveDependencies:
              GetCardsFromNameFamily._allTransitiveDependencies,
          cardName: cardName,
        );

  GetCardsFromNameProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.cardName,
  }) : super.internal();

  final String cardName;

  @override
  Override overrideWith(
    FutureOr<Iterable<MtgCard>> Function(GetCardsFromNameRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCardsFromNameProvider._internal(
        (ref) => create(ref as GetCardsFromNameRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        cardName: cardName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Iterable<MtgCard>> createElement() {
    return _GetCardsFromNameProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCardsFromNameProvider && other.cardName == cardName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cardName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetCardsFromNameRef on AutoDisposeFutureProviderRef<Iterable<MtgCard>> {
  /// The parameter `cardName` of this provider.
  String get cardName;
}

class _GetCardsFromNameProviderElement
    extends AutoDisposeFutureProviderElement<Iterable<MtgCard>>
    with GetCardsFromNameRef {
  _GetCardsFromNameProviderElement(super.provider);

  @override
  String get cardName => (origin as GetCardsFromNameProvider).cardName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
