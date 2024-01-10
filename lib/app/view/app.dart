import 'package:authentication_repository/authentication_repository.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_card_trading/app/app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_card_trading/pages/home/bloc/home_bloc.dart';

class App extends StatelessWidget {
  const App({
    required AuthenticationRepository authenticationRepository,
    super.key,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AppBloc(
              authenticationRepository: _authenticationRepository,
            ),
          ),
          BlocProvider(
            create: (context) => HomeBloc(),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    BuildContext? dialogContext;

    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          if (!state.isLoading && dialogContext != null) {
            Navigator.of(dialogContext!).pop();
            dialogContext = null;
          }
          if (state.errorMsg != '') {
            context.read<AppBloc>().add(const UserResetError());
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
              () => context.read<AppBloc>().add(const UserResetError()),
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
        },
        child: FlowBuilder<AppState>(
          state: context.watch<AppBloc>().state,
          onGeneratePages: onGenerateAppViewPages,
        ),
      ),
    );
  }
}
