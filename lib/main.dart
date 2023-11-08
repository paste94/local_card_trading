import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_card_trading/app.dart';
import 'package:local_card_trading/app_bloc_observer.dart';
import 'package:local_card_trading/firebase_options.dart';
import 'repository/auth/authentication_repository.dart';
import 'views/auth/bloc/authentication_bloc.dart';
import 'views/auth/bloc/form_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = AppBlocObserver();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => AuthenticationBloc(AuthenticationRepositoryImpl())
          ..add(AuthenticationStarted()),
      ),
      BlocProvider(
          create: (context) => FormBloc(AuthenticationRepositoryImpl()))
    ],
    child: const App(),
  ));
}
