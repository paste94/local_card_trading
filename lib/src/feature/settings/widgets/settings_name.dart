import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/feature/auth/providers/authentication/authentication_provider.dart';

class SettingsName extends ConsumerStatefulWidget {
  const SettingsName({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsNameState();
}

class _SettingsNameState extends ConsumerState<SettingsName> {
  final TextEditingController _nameController = TextEditingController();

  void _onConfirm() async {
    print('UPDATING NAME...');
    await ref
        .read(authenticationProvider.notifier)
        .updateName(_nameController.text);
    print('NAME UPDATED');

    // context.read<AppBloc>().add(
    //       UserUpdateName(
    //         _nameController.text,
    //         onSuccess: Navigator.of(context).pop,
    //       ),
    //     );
  }

  @override
  Widget build(BuildContext context) {
    final User? user = ref.watch(authenticationProvider).user;

    return ListTile(
      leading: const Icon(Icons.person),
      title: Text(AppLocalizations.of(context)!.name),
      subtitle: Text(user?.name ?? '**ERROR**'),
      trailing: const Icon(Icons.edit),
      onTap: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          showDragHandle: true,
          builder: (context) {
            _nameController.text = user?.name ?? '**ERROR**';
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
                          onPressed: () => _onConfirm(),
                          // _nameController.text != user!.name
                          //     ? _onConfirm
                          //     : Navigator.of(context).pop,
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




//   @override
//   Widget build(BuildContext context) {
//     final User user = context.select((AppBloc bloc) => bloc.state.user);

//     return ListTile(
//       leading: const Icon(Icons.person),
//       title: Text(AppLocalizations.of(context)!.name),
//       subtitle: Text(user.name ?? ''),
//       trailing: const Icon(Icons.edit),
//       onTap: () => showModalBottomSheet(
//           context: context,
//           isScrollControlled: true,
//           showDragHandle: true,
//           builder: (context) {
//             _nameController.text = user.name ?? '';
//             return FractionallySizedBox(
//               heightFactor: 0.6,
//               child: Column(
//                 children: [
//                   Text(AppLocalizations.of(context)!.insert_your_name),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.9,
//                     child: TextFormField(
//                       controller: _nameController,
//                       autofocus: true,
//                       decoration: InputDecoration(
//                         labelText: AppLocalizations.of(context)!.name,
//                       ),
//                     ),
//                   ),
//                   const Divider(color: Colors.transparent),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.9,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         TextButton(
//                           onPressed: Navigator.of(context).pop,
//                           child: Text(AppLocalizations.of(context)!.cancel),
//                         ),
//                         TextButton(
//                           onPressed: _onConfirm,
//                           child: Text(AppLocalizations.of(context)!.save),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }),
//     );
//   }
// }
