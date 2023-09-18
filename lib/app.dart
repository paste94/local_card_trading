import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_card_trading/views/auth/login.dart';
import 'package:local_card_trading/views/home/home.dart';

import 'bloc/authentication_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const BlocNavigate(),
        title: 'Constants.title',
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
      },
    );
  }
}