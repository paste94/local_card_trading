import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_card_trading/app/bloc/app_bloc.dart';
import 'package:authentication_repository/authentication_repository.dart';

class SettingsPassword extends StatelessWidget {
  const SettingsPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final User user = context.select((AppBloc bloc) => bloc.state.user);

    return ListTile(
      leading: const Icon(Icons.lock),
      title: Text(AppLocalizations.of(context)!.password),
      subtitle: const Text('***'),
      trailing: const Icon(Icons.edit),
      onTap: () {},
    );
  }
}
