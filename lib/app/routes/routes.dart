import 'package:flutter/material.dart';
import 'package:local_card_trading/app/app.dart';
import 'package:local_card_trading/pages/add_card_to_collection/add_card_to_collection.dart';
import 'package:local_card_trading/pages/home/home.dart';
import 'package:local_card_trading/pages/login/login.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppState state,
  List<Page<dynamic>> pages,
) {
  AuthStatus authStatus = state.status;
  switch (authStatus) {
    case AuthStatus.authenticated:
      SelectedPage selectedPage = state.selectedPage;
      switch (selectedPage) {
        case SelectedPage.home:
          return [
            const MaterialPage(
              child: HomePage(),
            ),
          ];
        case SelectedPage.addCardToCollection:
          return [
            const MaterialPage(
              child: AddCardToCollectionPage(),
            ),
          ];
      }
    case AuthStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
