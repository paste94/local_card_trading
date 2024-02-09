import 'package:flutter/material.dart';
import 'package:local_card_trading/src/core/widgets/custom_dialog.dart';
import 'package:local_card_trading/src/core/widgets/error_snackbar.dart';
import 'package:local_card_trading/src/feature/auth/providers/authentication/state/authentication_state.dart';
import 'package:local_card_trading/src/feature/auth/view/login_view.dart';
import 'package:local_card_trading/src/feature/auth/view/register_view.dart';
import 'package:local_card_trading/src/feature/home/view/home_view.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AuthenticationState authStatus,
  List<Page<dynamic>> pages,
) {
  return authStatus.maybeWhen(
    authenticated: (usr) => [HomeView.page()],
    login: () => [LoginView.page()],
    register: () => pages + [RegisterView.page()],
    orElse: () => pages,
  );
}
