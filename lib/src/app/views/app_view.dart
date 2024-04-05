import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/core/flow_builder/on_generate_pages.dart';
import 'package:local_card_trading/src/core/navigation/navigation_provider.dart';
import 'package:local_card_trading/src/core/navigation/state/navigation_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppView extends ConsumerWidget {
  AppView({super.key});
  final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    NavigationState authState = ref.watch(navigationProvider);

    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      scaffoldMessengerKey: _scaffoldKey,
      home: FlowBuilder<NavigationState>(
        state: authState,
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
