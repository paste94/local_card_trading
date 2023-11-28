import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:local_card_trading/pages/home/subpages/settings/cubit/settings_cubit.dart';

import 'tiles/settings_tiles.dart';

class SettingsForm extends StatelessWidget {
  const SettingsForm({super.key});
  final double _dividerIndent = 55.0;

  @override
  Widget build(BuildContext context) {
    BuildContext? dialogContext;

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
        } else if (state.status == FormzSubmissionStatus.inProgress) {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                dialogContext = context;
                return const Dialog(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 15),
                        Text('Loading...'),
                      ],
                    ),
                  ),
                );
              });
        } else if (state.status == FormzSubmissionStatus.success) {
          if (dialogContext != null) {
            Navigator.of(dialogContext!).pop();
            context.read<SettingsCubit>().resetCubit();
          }
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
