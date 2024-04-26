import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/core/navigation/riverpod/navigation_provider.dart';

class SettingsEmail extends ConsumerWidget {
  const SettingsEmail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? user = ref.watch(navigationProvider).user;

    return ListTile(
      leading: const Icon(Icons.email),
      title: Text(AppLocalizations.of(context)!.enter_email),
      subtitle: Text(user?.email ?? '**ERROR**'),
      // trailing: const Icon(Icons.edit),
      // onTap: () {},
    );
  }
}
