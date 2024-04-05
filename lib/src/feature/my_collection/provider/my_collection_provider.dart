import 'dart:async';

import 'package:local_card_trading/src/feature/my_collection/provider/state/my_collection_state.dart';
import 'package:local_card_trading/src/repository/card/scryfall_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'my_collection_provider.g.dart';

@riverpod
class MyCollection extends _$MyCollection {
  @override
  MyCollectionState build() {
    return const MyCollectionState();
  }
}
