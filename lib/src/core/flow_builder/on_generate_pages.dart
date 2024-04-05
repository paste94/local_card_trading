import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:local_card_trading/src/core/widgets/custom_dialog.dart';
import 'package:local_card_trading/src/feature/my_collection/view/add_card_to_collection.dart';
import 'package:local_card_trading/src/core/navigation/state/navigation_state.dart';
import 'package:local_card_trading/src/feature/auth/view/login_view.dart';
import 'package:local_card_trading/src/feature/auth/view/register_view.dart';
import 'package:local_card_trading/src/feature/home/view/home_view.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  NavigationState navigationStatus,
  List<Page<dynamic>> pages,
) {
  if (navigationStatus.user == User.empty) {
    return [
      LoginView.page(),
      if (navigationStatus.wannaRegister) RegisterView.page(),
    ];
  } else {
    return [
      HomeView.page(),
      if (navigationStatus.isAddCardPageOpen) AddCardToCollection.page(),
    ];
  }
}
