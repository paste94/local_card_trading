import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/firebase_options.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:local_card_trading/src/app/views/app_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.appAttest,
  );
  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;

  runApp(const ProviderScope(
    child: AppView(),
  ));
}
