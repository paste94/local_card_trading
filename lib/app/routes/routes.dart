import 'package:flutter/widgets.dart';
import 'package:local_card_trading/app/app.dart';
import 'package:local_card_trading/pages/home/home.dart';
// import 'package:local_card_trading/home/home.dart';
import 'package:local_card_trading/pages/login/login.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
