import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:local_card_trading/src/core/navigation/flow_builder_states_wrapper.dart';
import 'package:local_card_trading/src/feature/my_collection/add_card_to_collection/1.search_card_name/search_card_name.dart';
import 'package:local_card_trading/src/feature/my_collection/add_card_to_collection/selected_card_page.dart';
import 'package:local_card_trading/src/feature/auth/view/login_view.dart';
import 'package:local_card_trading/src/feature/auth/view/register_view.dart';
import 'package:local_card_trading/src/feature/home/view/home_view.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  FlowBuilderStatesWrapper state,
  List<Page<dynamic>> pages,
) {
  var authState = state.navigationState;
  var selectedCard = state.searchCardNameState;
  if (authState.user == User.empty) {
    return [
      LoginView.page(),
      if (authState.wannaRegister) RegisterView.page(),
    ];
  } else {
    return [
      HomeView.page(),
      if (authState.isAddCardPageOpen) SearchCardName.page(),
      if (selectedCard != null) SelectedCardPage.page(),
    ];
  }
}
