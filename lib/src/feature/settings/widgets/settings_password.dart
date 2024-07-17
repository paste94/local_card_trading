import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/core/widgets/inputs/inputs.dart';
import 'package:local_card_trading/src/core/navigation/navigation_provider.dart';

class SettingsPassword extends ConsumerStatefulWidget {
  const SettingsPassword({super.key});

  @override
  ConsumerState<SettingsPassword> createState() => _SettingsPasswordState();
}

class _SettingsPasswordState extends ConsumerState<SettingsPassword> {
  Password _currentPassword = const Password.pure();
  Password _newPassword = const Password.pure();
  ConfirmedPassword _confirmNewPassword = const ConfirmedPassword.pure();

  void _showModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) =>
            FractionallySizedBox(
          child: Column(
            children: [
              Text(AppLocalizations.of(context)!.insert_current_password),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  onChanged: (newVal) => setState(() {
                    _currentPassword = Password.dirty(newVal);
                  }),
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.password,
                    errorText:
                        _currentPassword.isValid || _currentPassword.isPure
                            ? null
                            : AppLocalizations.of(context)!.invalid_password,
                  ),
                ),
              ),
              Text(AppLocalizations.of(context)!.insert_new_password),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  onChanged: (newVal) => setState(() {
                    _newPassword = Password.dirty(newVal);
                    _confirmNewPassword = ConfirmedPassword.dirty(
                        password: _confirmNewPassword.value, value: newVal);
                  }),
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.password,
                    errorText: _newPassword.isValid || _newPassword.isPure
                        ? null
                        : AppLocalizations.of(context)!.invalid_password,
                  ),
                ),
              ),
              Text(AppLocalizations.of(context)!.repeat_new_password),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  obscureText: true,
                  onChanged: (newVal) => setState(() {
                    _confirmNewPassword = ConfirmedPassword.dirty(
                      password: newVal,
                      value: _newPassword.value,
                    );
                  }),
                  decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.repeat_password,
                      errorText: _confirmNewPassword.isPure ||
                              _confirmNewPassword.isValid
                          ? null
                          : AppLocalizations.of(context)!
                              .invalid_repeat_password),
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
                      onPressed: () => {
                        ref.read(navigationProvider.notifier).updatePassword(
                              _currentPassword.value,
                              _newPassword.value,
                            )
                      },
                      // _currentPassword.isValid &&
                      //         _newPassword.isValid &&
                      //         _confirmNewPassword.isValid
                      //     ? () =>
                      //      context
                      //         .read<AppBloc>()
                      //         .add(UserUpdatePassword(
                      //           _currentPassword.value,
                      //           _newPassword.value,
                      //           onSuccess: () => Navigator.of(context).pop(),
                      //         ))
                      //     : null,
                      child: Text(AppLocalizations.of(context)!.save),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ).whenComplete(() => setState(() {
          _currentPassword = const Password.pure();
          _newPassword = const Password.pure();
          _confirmNewPassword = const ConfirmedPassword.pure();
        }));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.lock),
      title: Text(AppLocalizations.of(context)!.password),
      subtitle: const Text('***'),
      // trailing: user.loginMethods!.contains('google.com')
      //     ? null
      //     : const Icon(Icons.edit),
      // onTap:
      //     user.loginMethods!.contains('google.com') ? null : () => _showModal(),
    );
  }
}
