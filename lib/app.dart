import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_card_trading/constants/routes.dart';
import 'package:local_card_trading/views/auth/login_view/login.dart';
import 'package:local_card_trading/views/auth/register_view/register.dart';
import 'package:local_card_trading/views/home/home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'bloc/auth/authentication_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const BlocNavigate(),
        title: 'Constants.title',
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        routes: {
          ROUTE_HOME: (context) => const HomeView(),
          ROUTE_LOGIN: (context) => const LoginView(),
          ROUTE_REGISTER: (context) => const RegisterView(),
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ));
  }
}

class BlocNavigate extends StatelessWidget {
  const BlocNavigate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationSuccess) {
          return const HomeView();
        } else {
          return const LoginView();
        }
        // TODO: Add splash page
      },
    );
  }
}
