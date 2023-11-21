import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_card_trading/app/bloc/app_bloc.dart';

class SettingsLogout extends StatelessWidget {
  const SettingsLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.logout),
      title: Text(AppLocalizations.of(context)!.logout),
      onTap: () => _logout(context),
    );
  }

  void _logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.confirm),
          content: Text(AppLocalizations.of(context)!.confirm_dialog),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(AppLocalizations.of(context)!.cancel)),
            TextButton(
              onPressed: () {
                context.read<AppBloc>().add(const AppLogoutRequested());
                Navigator.of(context).pop();
              },
              child: Text(AppLocalizations.of(context)!.logout),
            ),
          ],
        );
      },
    );
  }
}
