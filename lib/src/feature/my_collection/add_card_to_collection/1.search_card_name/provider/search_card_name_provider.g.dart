// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_card_name_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchCardsHash() => r'bef97f3407237cf88c9c2372a6335fa05b074e1a';

/// See also [fetchCards].
@ProviderFor(fetchCards)
final fetchCardsProvider =
    AutoDisposeFutureProvider<PaginableList<MyMtgCard>>.internal(
  fetchCards,
  name: r'fetchCardsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchCardsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchCardsRef = AutoDisposeFutureProviderRef<PaginableList<MyMtgCard>>;
String _$searchCardNameHash() => r'ec1ff3b4511632a3f3f1bf0783985e3d5dcd34c8';

/// See also [SearchCardName].
@ProviderFor(SearchCardName)
final searchCardNameProvider =
    AutoDisposeNotifierProvider<SearchCardName, String>.internal(
  SearchCardName.new,
  name: r'searchCardNameProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchCardNameHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchCardName = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
