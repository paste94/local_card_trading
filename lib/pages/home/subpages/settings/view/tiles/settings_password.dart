import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_card_trading/app/bloc/app_bloc.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:local_card_trading/pages/home/subpages/settings/cubit/settings_cubit.dart';

class SettingsPassword extends StatelessWidget {
  const SettingsPassword({super.key});

  // final _currentPasswordController = TextEditingController();
  // var newStatus = FormzSubmissionStatus.initial;

  @override
  Widget build(BuildContext context) {
    // final User user = context.select((AppBloc bloc) => bloc.state.user);

    return ListTile(
      leading: const Icon(Icons.lock),
      title: Text(AppLocalizations.of(context)!.password),
      subtitle: const Text('***'),
      trailing: const Icon(Icons.edit),
      onTap: () => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        showDragHandle: true,
        builder: _showModalEditPassword,
      ),
    );
  }

  Widget _showModalEditPassword(BuildContext context) {
    final User user = context.select((AppBloc bloc) => bloc.state.user);

    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: FractionallySizedBox(
        child: Column(
          children: [
            Text(AppLocalizations.of(context)!.insert_current_password),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: const _CurrentPasswordInput(),
            ),
            Text(AppLocalizations.of(context)!.insert_new_password),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: const _NewPasswordInput(),
            ),
            Text(AppLocalizations.of(context)!.repeat_new_password),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: const _ConfirmNewPassword(),
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
                    onPressed: () {
                      // context.read<AppBloc>().add(AppUserUpdateName(
                      //       _newPasswordController.text,
                      //       onSuccess: () => Navigator.of(context).pop(),
                      //     ));
                    },
                    child: Text(AppLocalizations.of(context)!.save),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CurrentPasswordInput extends StatelessWidget {
  const _CurrentPasswordInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      buildWhen: (previous, current) =>
          previous.currentPassword != current.currentPassword,
      builder: (context, state) => TextField(
        onChanged: (currentPassword) => context
            .read<SettingsCubit>()
            .currentPasswordChanged(currentPassword),
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
