import 'package:flutter/material.dart';
import 'package:local_card_trading/constants/routes.dart';
import 'package:local_card_trading/services/auth/auth_service.dart';
import 'package:local_card_trading/utils/dialogs.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).register)),
      body: Column(
        children: [
          TextField(
            controller: _email,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: AppLocalizations.of(context).enter_email),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(
                hintText: AppLocalizations.of(context).password),
          ),
          TextButton(
            child: Text(AppLocalizations.of(context).register),
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;
              AuthService.firebase()
                  .createUser(
                    email: email,
                    password: password,
                  )
                  .then(
                    (value) => Navigator.of(context).pushNamedAndRemoveUntil(
                      ROUTE_HOME,
                      (route) => false,
                    ),
                  )
                  .catchError(
                    (e) => showErrorDialog(
                      context,
                      e.toString(),
                    ),
                  );
            },
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
              ROUTE_LOGIN,
              (_) => false,
            ),
            child: Text(AppLocalizations.of(context).click_to_log_in),
          )
        ],
      ),
    );
  }
}
