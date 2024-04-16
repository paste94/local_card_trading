import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/app/handlers/error_handler.dart';
import 'package:local_card_trading/src/app/handlers/loading_handler.dart';
import 'package:local_card_trading/src/core/errors/error_provider.dart';
import 'package:local_card_trading/src/core/errors/state/error_state.dart';
import 'package:local_card_trading/src/core/flow_builder/on_generate_pages.dart';
import 'package:local_card_trading/src/core/navigation/navigation_provider.dart';
import 'package:local_card_trading/src/core/navigation/state/navigation_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_card_trading/src/feature/add_card_to_collection/provider/search_card_provider.dart';

class AppView extends ConsumerWidget {
  AppView({super.key});
  final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      scaffoldMessengerKey: _scaffoldKey,
      home: FlowBuilder(
        state: ref,
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
