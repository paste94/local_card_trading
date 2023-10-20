import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:local_card_trading/bloc/auth/authentication_bloc.dart';
import 'package:local_card_trading/bloc/form/form_bloc.dart';
import 'package:local_card_trading/constants/routes.dart';
import 'package:local_card_trading/utils/widgets/auth/auth_widgets.dart';
import 'package:local_card_trading/utils/widgets/dialogs.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          formBlocListener,
          authBlocListener,
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)?.register ?? ''),
          ),
          body: const Center(
            child: Column(
              children: [
                TxtEmail(),
                TxtPassword(),
                //TODO: Aggiungi repeat password
                TxtDispalyName(),
                TxtBirthDate(),
                Divider(
                  height: 30,
                  color: Colors.transparent,
                ),
              ],
            ),
          ),
        ));
  }
}
