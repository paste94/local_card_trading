// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_card_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getSetHash() => r'e15e317502ac2453aa3ea2a08ceeedc0d026664c';

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

/// See also [getSet].
@ProviderFor(getSet)
const getSetProvider = GetSetFamily();

/// See also [getSet].
class GetSetFamily extends Family<Object?> {
  /// See also [getSet].
  const GetSetFamily();

  /// See also [getSet].
  GetSetProvider call(
    String id,
  ) {
    return GetSetProvider(
      id,
    );
  }

  @override
  GetSetProvider getProviderOverride(
    covariant GetSetProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'getSetProvider';
}

/// See also [getSet].
class GetSetProvider extends AutoDisposeProvider<Object?> {
  /// See also [getSet].
  GetSetProvider(
    String id,
  ) : this._internal(
          (ref) => getSet(
            ref as GetSetRef,
            id,
          ),
          from: getSetProvider,
          name: r'getSetProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getSetHash,
          dependencies: GetSetFamily._dependencies,
          allTransitiveDependencies: GetSetFamily._allTransitiveDependencies,
          id: id,
        );

  GetSetProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    Object? Function(GetSetRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetSetProvider._internal(
        (ref) => create(ref as GetSetRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Object?> createElement() {
    return _GetSetProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetSetProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetSetRef on AutoDisposeProviderRef<Object?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetSetProviderElement extends AutoDisposeProviderElement<Object?>
    with GetSetRef {
  _GetSetProviderElement(super.provider);

  @override
  String get id => (origin as GetSetProvider).id;
}

String _$selectedCardIndexHash() => r'd678d0988966ae019b6c4b80e5edc11b28eefaa5';

/// See also [SelectedCardIndex].
@ProviderFor(SelectedCardIndex)
final selectedCardIndexProvider =
    AutoDisposeNotifierProvider<SelectedCardIndex, int>.internal(
  SelectedCardIndex.new,
  name: r'selectedCardIndexProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedCardIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedCardIndex = AutoDisposeNotifier<int>;
String _$selectedCardHash() => r'6a6a06446b96c9bcb7b858cea5515b942e74b7cf';

/// See also [SelectedCard].
@ProviderFor(SelectedCard)
final selectedCardProvider =
    AutoDisposeNotifierProvider<SelectedCard, MyMtgCard?>.internal(
  SelectedCard.new,
  name: r'selectedCardProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$selectedCardHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedCard = AutoDisposeNotifier<MyMtgCard?>;
String _$selectedCardNameHash() => r'7a52c2e5c14fb0750bf74c5e733214d2ecbc9bd8';

/// See also [SelectedCardName].
@ProviderFor(SelectedCardName)
final selectedCardNameProvider = AutoDisposeNotifierProvider<SelectedCardName,
    PaginableList<MyMtgCard>?>.internal(
  SelectedCardName.new,
  name: r'selectedCardNameProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedCardNameHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedCardName = AutoDisposeNotifier<PaginableList<MyMtgCard>?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
