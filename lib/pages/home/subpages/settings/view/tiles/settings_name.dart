import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_card_trading/app/bloc/app_bloc.dart';
import 'package:authentication_repository/authentication_repository.dart';

class SettingsName extends StatefulWidget {
  const SettingsName({super.key});

  @override
  State<SettingsName> createState() => _SettingsNameState();
}

class _SettingsNameState extends State<SettingsName> {
  final TextEditingController _nameController = TextEditingController();

  void _onConfirm() {
    context.read<AppBloc>().add(
          UserUpdateName(
            _nameController.text,
            onSuccess: Navigator.of(context).pop,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final User user = context.select((AppBloc bloc) => bloc.state.user);

    return ListTile(
      leading: const Icon(Icons.person),
      title: Text(AppLocalizations.of(context)!.name),
      subtitle: Text(user.name ?? ''),
      trailing: const Icon(Icons.edit),
      onTap: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          showDragHandle: true,
          builder: (context) {
            _nameController.text = user.name ?? '';
            return FractionallySizedBox(
              heightFactor: 0.6,
              child: Column(
                children: [
                  Text(AppLocalizations.of(context)!.insert_your_name),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                      controller: _nameController,
                      autofocus: true,
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
                          onPressed: Navigator.of(context).pop,
                          child: Text(AppLocalizations.of(context)!.cancel),
                        ),
                        TextButton(
                          onPressed: _onConfirm,
                          child: Text(AppLocalizations.of(context)!.save),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
