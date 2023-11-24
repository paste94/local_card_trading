import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_card_trading/app/app.dart';
import 'package:local_card_trading/pages/home/bloc/home_bloc.dart';
import 'package:local_card_trading/pages/home/subpages/settings/cubit/settings_cubit.dart';
import 'package:local_card_trading/pages/home/view/home_body.dart';
import 'package:local_card_trading/pages/home/view/home_bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeBloc(),
        ),
      ],
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
        body: BlocListener<AppBloc, AppState>(
          listener: (context, state) {
            if (state.errorMsg != '') {
              context.read<AppBloc>().add(const AppUserResetError());

              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Error'),
                  content: Text(state.errorMsg),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Ok'),
                    )
                  ],
                ),
              );
            }
          },
          child: const HomeBody(),
        ),
        bottomNavigationBar: const HomeBottomNavigationBar(),
      ),
    );
  }
}
