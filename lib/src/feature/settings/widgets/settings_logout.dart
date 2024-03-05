import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/feature/auth/providers/authentication/authentication_provider.dart';

class SettingsLogout extends ConsumerWidget {
  const SettingsLogout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: const Icon(Icons.logout),
      title: Text(AppLocalizations.of(context)!.logout),
      onTap: () => showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(AppLocalizations.of(context)!.confirm_ans),
            content: Text(AppLocalizations.of(context)!.confirm_dialog),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(AppLocalizations.of(context)!.cancel),
              ),
              TextButton(
                onPressed: () => ref
                    .read(authenticationProvider.notifier)
                    .logout()
                    .then(Navigator.of(context).pop),
                child: Text(AppLocalizations.of(context)!.logout),
              ),
            ],
          );
        },
      ),
    );
  }
}
