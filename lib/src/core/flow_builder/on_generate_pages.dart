import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/core/navigation/navigation_provider.dart';
import 'package:local_card_trading/src/feature/add_card_to_collection/provider/search_card_provider.dart';
import 'package:local_card_trading/src/feature/add_card_to_collection/view/add_card_to_collection_page.dart';
import 'package:local_card_trading/src/core/navigation/state/navigation_state.dart';
import 'package:local_card_trading/src/feature/add_card_to_collection/view/selected_card_page.dart';
import 'package:local_card_trading/src/feature/auth/view/login_view.dart';
import 'package:local_card_trading/src/feature/auth/view/register_view.dart';
import 'package:local_card_trading/src/feature/home/view/home_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "on_generate_pages.g.dart";

@riverpod
class GenerateRoute extends _$GenerateRoute {
  @override
  List<Page<dynamic>> build() {
    var authState = ref.watch(navigationProvider);
    var selectedCard = ref.watch(selectedCardProvider);
    if (authState.user == User.empty) {
      return [
        LoginView.page(),
        if (authState.wannaRegister) RegisterView.page(),
      ];
    } else {
      return [
        HomeView.page(),
        if (authState.isAddCardPageOpen) AddCardToCollectionPage.page(),
        if (selectedCard != null) SelectedCardPage.page(),
      ];
    }
  }
}

// @riverpod
// List<Page<dynamic>> onGenerateAppViewPages(
//   WidgetRef ref,
//   List<Page<dynamic>> pages,
// ) {
//   var authState = ref.watch(navigationProvider);
//   var selectedCard = ref.watch(selectedCardProvider);
//   if (authState.user == User.empty) {
//     return [
//       LoginView.page(),
//       if (authState.wannaRegister) RegisterView.page(),
//     ];
//   } else {
//     return [
//       HomeView.page(),
//       if (authState.isAddCardPageOpen) AddCardToCollectionPage.page(),
//       if (selectedCard != null) SelectedCardPage.page(),
//     ];
//   }
// }

// @riverpod
// String? selectedCard(SelectedCardRef ref) {
//   String? searchState = ref.watch(selectedCardProvider);
//   return searchState;
// }
