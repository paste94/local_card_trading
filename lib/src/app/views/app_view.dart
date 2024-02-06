import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/core/flow_builder/on_generate_pages.dart';
import 'package:local_card_trading/src/feature/auth/providers/authentication/authentication_provider.dart';
import 'package:local_card_trading/src/feature/auth/providers/authentication/state/authentication_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppView extends ConsumerWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AuthenticationState authState = ref.read(authenticationProvider);

    print('**************** $authState');
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: FlowBuilder<AuthenticationState>(
        state: authState,
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
