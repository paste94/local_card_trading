import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:local_card_trading/src/app/models/my_mtg_card.dart';
import 'package:local_card_trading/src/core/flow_builder/flow_builder_states_wrapper.dart';
import 'package:local_card_trading/src/core/navigation/state/navigation_state.dart';
import 'package:local_card_trading/src/core/widgets/full_screen_image.dart';
import 'package:local_card_trading/src/feature/my_collection/add_card_to_collection/1.search_card_name/search_card_name.dart';
import 'package:local_card_trading/src/feature/my_collection/add_card_to_collection/2.search_card_details/search_card_details.dart';
import 'package:local_card_trading/src/feature/auth/view/login_view.dart';
import 'package:local_card_trading/src/feature/auth/view/register_view.dart';
import 'package:local_card_trading/src/feature/home/view/home_view.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  FlowBuilderStatesWrapper state,
  List<Page<dynamic>> pages,
) {
  NavigationState authState = state.navigationState;
  MyMtgCard? selectedCard = state.selectedCard;

  return [
    if (authState.user == User.empty) LoginView.page() else HomeView.page(),
    if (authState.user == User.empty && authState.wannaRegister)
      RegisterView.page(),
    if (authState.isAddCardPageOpen) SearchCardName.page(),
    if (selectedCard != null) SearchCardDetails.page(),
    if (authState.fullScreenImage != null) FullScreenImage.page(),
  ];
}
