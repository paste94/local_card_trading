import 'package:flutter/widgets.dart';
import 'package:local_card_trading/app/app.dart';
import 'package:local_card_trading/pages/home/home.dart';
import 'package:local_card_trading/pages/login/login.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AuthStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AuthStatus.authenticated:
      return [HomePage.page()];
    case AuthStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
