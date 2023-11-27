import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_card_trading/pages/home/subpages/settings/cubit/settings_cubit.dart';
import 'package:local_card_trading/pages/home/subpages/settings/view/settings_form.dart';
import 'package:local_card_trading/pages/home/subpages/settings/view/tiles/settings_tiles.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SettingsCubit(context.read<AuthenticationRepository>()),
      child: const SettingsForm(),
    );
  }
}
