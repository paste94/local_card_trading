import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_card_trading/bloc/form/form_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_card_trading/constants/auth_view_const.dart';
import 'package:local_card_trading/constants/routes.dart';
import 'package:local_card_trading/utils/widgets/auth/auth_widgets.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        formBlocListener,
        authBlocListener,
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)?.login ?? ''),
        ),
        body: const Center(
          child: Column(
            children: [
              TxtEmail(),
              TxtPassword(),
              Divider(
                height: ABS_DIV_HEIGHT,
                color: DIV_COLOR,
              ),
              BtnSubmit(status: Status.signIn),
              BtnGoTo(route: ROUTE_REGISTER),
            ],
          ),
        ),
      ),
    );
  }
}
