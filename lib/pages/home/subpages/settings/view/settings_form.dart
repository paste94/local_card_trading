import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'tiles/settings_tiles.dart';

class SettingsForm extends StatelessWidget {
  const SettingsForm({super.key});
  final double _dividerIndent = 55.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SettingsPhoto(),
          const Divider(color: Colors.transparent),
          SettingsSection(title: AppLocalizations.of(context)!.account),
          const SettingsEmail(),
          Divider(indent: _dividerIndent),
          const SettingsName(),
          Divider(indent: _dividerIndent),
          const SettingsPassword(),
          Divider(indent: _dividerIndent),
          const SettingsLogout(),
        ],
      ),
      // ),
    );
  }
}
