import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_card_trading/app/bloc/app_bloc.dart';
import 'package:authentication_repository/authentication_repository.dart';

class SettingsEmail extends StatelessWidget {
  const SettingsEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final User user = context.select((AppBloc bloc) => bloc.state.user);

    return ListTile(
      leading: const Icon(Icons.email),
      title: Text(AppLocalizations.of(context)!.enter_email),
      subtitle: Text(user.email ?? ''),
      // trailing: const Icon(Icons.edit),
      // onTap: () {},
    );
  }
}
