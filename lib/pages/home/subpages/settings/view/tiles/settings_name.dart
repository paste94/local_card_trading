import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:local_card_trading/app/bloc/app_bloc.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:local_card_trading/pages/home/subpages/settings/cubit/settings_cubit.dart';

class SettingsName extends StatelessWidget {
  const SettingsName({super.key});

  @override
  Widget build(BuildContext context) {
    final User user = context.select((AppBloc bloc) => bloc.state.user);
    final SettingsCubit settingsCubit = context.read<SettingsCubit>();
    settingsCubit.nameChanged(user.name ?? '');

    return BlocBuilder<SettingsCubit, SettingsState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return ListTile(
          leading: const Icon(Icons.person),
          title: Text(AppLocalizations.of(context)!.name),
          subtitle: Text(state.name.value),
          trailing: const Icon(Icons.edit),
          onTap: () => showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            showDragHandle: true,
            builder: (context) => FractionallySizedBox(
              heightFactor: 0.6,
              child: Column(
                children: [
                  Text(AppLocalizations.of(context)!.insert_your_name),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                      autofocus: true,
                      initialValue: state.name.value,
                      onChanged: (name) => settingsCubit.nameChanged(name),
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.name,
                      ),
                    ),
                  ),
                  const Divider(color: Colors.transparent),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(AppLocalizations.of(context)!.cancel),
                        ),
                        TextButton(
                          onPressed: () => settingsCubit
                              .changeNameFormSubmitted()
                              .then((_) => Navigator.of(context).pop()),
                          child: Text(AppLocalizations.of(context)!.save),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ).whenComplete(() => settingsCubit.resetCubit()),
        );
      },
    );
  }
}
