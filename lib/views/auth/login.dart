import 'package:flutter/material.dart';
import 'package:local_card_trading/constants/routes.dart';
import 'package:local_card_trading/services/auth/auth_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_card_trading/utils/dialogs.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
    navigateToHome(value) => Navigator.of(context).pushNamedAndRemoveUntil(
          ROUTE_HOME,
          (route) => false,
        );

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)?.login ?? '')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _email,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)?.enter_email),
            ),
            TextField(
              controller: _password,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)?.password),
            ),
            TextButton(
              child: Text(AppLocalizations.of(context)!.login),
              onPressed: () async {
                final email = _email.text;
                final password = _password.text;
                AuthService.firebase()
                    .logIn(
                      email: email,
                      password: password,
                    )
                    .then(navigateToHome)
                    .catchError(
                      (e) => showErrorDialog(
                        context,
                        e.toString(),
                      ),
                    );
              },
            ),
            TextButton(
              child: Text(AppLocalizations.of(context)!.click_to_register),
              onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
                ROUTE_REGISTER,
                (route) => false,
              ),
            ),
            TextButton(
                onPressed: () {
                  AuthService.firebase()
                      .signInWithGoogle()
                      .then(navigateToHome)
                      .catchError(
                        (e) => showErrorDialog(
                          context,
                          e.toString(),
                        ),
                      );
                },
                child: Text('Google'))
          ],
        ),
      ),
    );
  }
}
