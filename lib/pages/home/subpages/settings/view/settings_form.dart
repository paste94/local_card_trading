import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_card_trading/app/bloc/app_bloc.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:local_card_trading/pages/home/subpages/settings/cubit/settings_cubit.dart';

import 'tiles/settings_tiles.dart';

class SettingsForm extends StatelessWidget {
  const SettingsForm({super.key});
  final double _dividerIndent = 55.0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state.errorMsg != '') {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMsg,
                ),
              ),
            )
                .closed
                .then((value) => context.read<SettingsCubit>().resetError());
        }
      },
      child: SingleChildScrollView(
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
      ),
    );
  }
}
