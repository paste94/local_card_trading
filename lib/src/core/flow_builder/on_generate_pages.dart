import 'package:flutter/material.dart';
import 'package:local_card_trading/src/feature/auth/providers/authentication/state/authentication_state.dart';
import 'package:local_card_trading/src/feature/auth/view/login_view.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AuthenticationState authStatus,
  List<Page<dynamic>> pages,
) {
  return authStatus.when(
      initial: () => [LoginView.page()],
      loading: () => [LoginView.page()],
      unauthenticated: (str) => [LoginView.page()],
      authenticated: (usr) => [LoginView.page()]);
}
