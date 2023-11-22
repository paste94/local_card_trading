import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:local_card_trading/app/bloc/app_bloc.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:local_card_trading/widgets/password.dart';

class SettingsPassword extends StatefulWidget {
  const SettingsPassword({super.key});

  @override
  State<SettingsPassword> createState() => _SettingsPasswordState();
}

class _SettingsPasswordState extends State<SettingsPassword> {
  final _currentPasswordController = TextEditingController();
  late TextEditingController _newPasswordController;
  late TextEditingController _repeatNewPasswordController;
  bool _isNewPasswordValid = Password.pure().isValid;
  bool _isRepeatPasswordValid = Password.pure().isValid;

  @override
  void initState() {
    _newPasswordController = TextEditingController()
      ..addListener(() {
        setState(() {
          _isNewPasswordValid =
              Password.dirty(_newPasswordController.text).isValid;
        });
      });
    _repeatNewPasswordController = TextEditingController()
      ..addListener(() {
        setState(() {
          _isRepeatPasswordValid =
              Password.dirty(_repeatNewPasswordController.text).isValid;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _repeatNewPasswordController.dispose();
    super.dispose();
  }

  var newStatus = FormzSubmissionStatus.initial;
  @override
  Widget build(BuildContext context) {
    final User user = context.select((AppBloc bloc) => bloc.state.user);

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

    return FractionallySizedBox(
      child: Column(
        children: [
          Text(AppLocalizations.of(context)!.insert_current_password),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              controller: _currentPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                helperText: '',
                labelText: AppLocalizations.of(context)?.password,
              ),
            ),
          ),
          Text(AppLocalizations.of(context)!.insert_new_password),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                helperText: '',
                labelText: AppLocalizations.of(context)?.password,
                errorText: _isNewPasswordValid ? null : 'ERROR',
              ),
            ),
          ),
          Text(AppLocalizations.of(context)!.repeat_new_password),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              controller: _repeatNewPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                helperText: '',
                labelText: AppLocalizations.of(context)?.password,
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
    );
  }
}
