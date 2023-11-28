import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_card_trading/app/bloc/app_bloc.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:local_card_trading/pages/home/subpages/settings/cubit/settings_cubit.dart';

class SettingsPassword extends StatelessWidget {
  const SettingsPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsCubit settingsCubit = context.read<SettingsCubit>();

    return BlocBuilder<SettingsCubit, SettingsState>(
      buildWhen: (previous, current) =>
          previous.newPassword != current.newPassword ||
          previous.confirmNewPassword != current.confirmNewPassword,
      builder: (context, state) {
        return ListTile(
          leading: const Icon(Icons.lock),
          title: Text(AppLocalizations.of(context)!.password),
          subtitle: const Text('***'),
          trailing: const Icon(Icons.edit),
          onTap: () => showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            showDragHandle: true,
            builder: (context) => FractionallySizedBox(
              child: Column(
                children: [
                  Text(AppLocalizations.of(context)!.insert_new_password),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextField(
                      onChanged: (newPassword) =>
                          settingsCubit.newPasswordChanged(newPassword),
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.password,
                        errorText: state.newPassword.displayError != null
                            ? AppLocalizations.of(context)!.invalid_password
                            : null,
                      ),
                    ),
                  ),
                  Text(AppLocalizations.of(context)!.repeat_new_password),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextField(
                      onChanged: (confirmNewPassword) => settingsCubit
                          .confirmNewPasswordChanged(confirmNewPassword),
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.password,
                        errorText: state.confirmNewPassword.displayError != null
                            ? AppLocalizations.of(context)!
                                .invalid_repeat_password
                            : null,
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
                          onPressed: () {},
                          child: Text(AppLocalizations.of(context)!.save),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CurrentPasswordInput extends StatelessWidget {
  const _CurrentPasswordInput(this.cubit);
  final SettingsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      buildWhen: (previous, current) =>
          previous.currentPassword != current.currentPassword,
      builder: (context, state) => TextField(
        onChanged: (currentPassword) =>
            cubit.currentPasswordChanged(currentPassword),
        obscureText: true,
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context)!.password,
          errorText: state.currentPassword.displayError != null
              ? AppLocalizations.of(context)!.invalid_password
              : null,
        ),
      ),
    );
  }
}

class _NewPasswordInput extends StatelessWidget {
  const _NewPasswordInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      buildWhen: (previous, current) =>
          previous.newPassword != current.newPassword,
      builder: (context, state) => TextField(
        onChanged: (newPassword) =>
            context.read<SettingsCubit>().newPasswordChanged(newPassword),
        obscureText: true,
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context)!.password,
          errorText: state.newPassword.displayError != null
              ? AppLocalizations.of(context)!.invalid_password
              : null,
        ),
      ),
    );
  }
}

class _ConfirmNewPassword extends StatelessWidget {
  const _ConfirmNewPassword();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      buildWhen: (previous, current) =>
          previous.confirmNewPassword != current.confirmNewPassword,
      builder: (context, state) => TextField(
        onChanged: (confirmNewPassword) => context
            .read<SettingsCubit>()
            .confirmNewPasswordChanged(confirmNewPassword),
        obscureText: true,
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context)!.password,
          errorText: state.confirmNewPassword.displayError != null
              ? AppLocalizations.of(context)!.invalid_repeat_password
              : null,
        ),
      ),
    );
  }
}
