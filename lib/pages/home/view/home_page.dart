import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_card_trading/app/app.dart';
import 'package:local_card_trading/pages/home/bloc/home_bloc.dart';
import 'package:local_card_trading/pages/home/view/home_body.dart';
import 'package:local_card_trading/pages/home/view/home_bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    BuildContext? dialogContext;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeBloc(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
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
              ).whenComplete(
                () => context.read<AppBloc>().add(const AppUserResetError()),
              );
            }
            if (state.isLoading) {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    dialogContext = context;
                    return const Dialog(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 15),
                            Text('Loading...'),
                          ],
                        ),
                      ),
                    );
                  });
            }
            if (!state.isLoading) {
              if (dialogContext != null) {
                Navigator.of(dialogContext!).pop();
                dialogContext = null;
              }
            }
          },
          child: const HomeBody(),
        ),
        bottomNavigationBar: const HomeBottomNavigationBar(),
      ),
    );
  }
}
