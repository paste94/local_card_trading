import 'package:flutter/material.dart';
import 'package:local_card_trading/constants/routes.dart';
import 'package:local_card_trading/services/auth/auth_service.dart';
import 'package:local_card_trading/views/home/home.dart';
import 'package:local_card_trading/views/auth/login.dart';
import 'package:local_card_trading/views/auth/register.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_card_trading/views/settings/settings.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomePage(),
    // Definisce tutte le named route presenti nell'app
    routes: {
      ROUTE_LOGIN: (context) => const LoginView(),
      ROUTE_REGISTER: (context) => const RegisterView(),
      ROUTE_HOME: (context) => const HomeView(),
      ROUTE_SETTINGS: (context) => const SettingsView(),
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AuthService.firebase().initialize(),
        builder: ((context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = AuthService.firebase().currentUser;
              if (user != null) {
                return const HomeView();
              }
              return const LoginView();
            default:
              return const CircularProgressIndicator();
          }
        }));
  }
}
