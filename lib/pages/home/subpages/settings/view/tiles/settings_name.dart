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
  final _nameController = TextEditingController();
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
        builder: _showModalEditName,
      ),
    );
  }

  Widget _showModalEditName(BuildContext context) {
    final User user = context.select((AppBloc bloc) => bloc.state.user);

    _nameController.text = user.name ?? '';
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const Icon(
            Icons.horizontal_rule_rounded,
            size: 40,
            color: Colors.grey,
          ),
          Text('Insert your name'),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextField(
              controller: _nameController,
            ),
          ),
          const Divider(color: Colors.transparent),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Confirm'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
