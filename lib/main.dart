import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/firebase_options.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:local_card_trading/src/app/app_view.dart';
import 'package:local_card_trading/src/app/observers/my_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.appAttest,
  );

  runApp(
    ProviderScope(
      observers: [LogObserver()],
      child: AppView(),
    ),
  );
}
