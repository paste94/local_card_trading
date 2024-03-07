import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:local_card_trading/src/core/widgets/custom_dialog.dart';
import 'package:local_card_trading/src/feature/auth/providers/authentication/state/authentication_state.dart';
import 'package:local_card_trading/src/feature/auth/view/login_view.dart';
import 'package:local_card_trading/src/feature/auth/view/register_view.dart';
import 'package:local_card_trading/src/feature/home/view/home_view.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AuthenticationState authStatus,
  List<Page<dynamic>> pages,
) {
  if (authStatus.user == User.empty) {
    return [
      LoginView.page(),
      if (authStatus.wannaRegister) RegisterView.page(),
    ];
  } else {
    return [
      HomeView.page(),
      if (authStatus.loading) ProgressDialog.page(),
    ];
  }
}
