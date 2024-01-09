import 'package:flutter/widgets.dart';
import 'package:local_card_trading/app/app.dart';
import 'package:local_card_trading/pages/add_card_to_collection/add_card_to_collection.dart';
import 'package:local_card_trading/pages/home/home.dart';
import 'package:local_card_trading/pages/login/login.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AuthState state,
  List<Page<dynamic>> pages,
) {
  AuthStatus authStatus = state.status;
  switch (authStatus) {
    case AuthStatus.authenticated:
      SelectedPage selectedPage = state.selectedPage;
      switch (selectedPage) {
        case SelectedPage.home:
          return [HomePage.page()];
        case SelectedPage.addCardToCollection:
          return [AddCardToCollectionPage.page()];
      }
    case AuthStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
