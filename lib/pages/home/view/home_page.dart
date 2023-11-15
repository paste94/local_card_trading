import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_card_trading/app/app.dart';
import 'package:local_card_trading/pages/home/bloc/home_bloc.dart';
import 'package:local_card_trading/pages/home/view/constants.dart';
import 'package:local_card_trading/pages/home/view/home_body.dart';
import 'package:local_card_trading/pages/home/view/home_bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: <Widget>[
            IconButton(
              key: const Key('homePage_logout_iconButton'),
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                context.read<AppBloc>().add(const AppLogoutRequested());
              },
            ),
          ],
        ),
        body: const HomeBody(),
        bottomNavigationBar: const HomeBottomNavigationBar(),
      ),
    );
  }
}
