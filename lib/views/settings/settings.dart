import 'package:flutter/material.dart';
import 'package:local_card_trading/constants/routes.dart';
import 'package:local_card_trading/services/auth/auth_service.dart';
import 'package:local_card_trading/utils/dialogs.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text(AppLocalizations.of(context)!.account),
            tiles: [
              SettingsTile.navigation(
                title: Text(AppLocalizations.of(context)!.logout),
                leading: const Icon(Icons.logout),
                onPressed: (context) => showConfirmDialog(
                  context: context,
                  title: AppLocalizations.of(context)!.logoud_dialog_title,
                  text: AppLocalizations.of(context)!.logoud_dialog_text,
                  onAcceptPressed: () => AuthService.firebase().logOut().then(
                        (value) =>
                            Navigator.of(context).pushNamedAndRemoveUntil(
                          ROUTE_LOGIN,
                          (route) => false,
                        ),
                      ),
                ),
              )
            ],
          ),
        ],
      ),
      // Center(
      //   child: ElevatedButton(
      //     child: Text(AppLocalizations.of(context)!.logout),
      //     onPressed: () => AuthService.firebase().logOut(),
      //   ),
      // ),
    );
  }
}
