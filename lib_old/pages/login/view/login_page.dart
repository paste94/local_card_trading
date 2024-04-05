import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_card_trading/pages/login/login.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.login)),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider<LoginCubit>(
          create: (_) => LoginCubit(context.read<NavigationRepository>()),
          child: const LoginForm(),
        ),
      ),
    );
  }
}
