import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/feature/settings/widgets/settings_email.dart';
import 'package:local_card_trading/src/feature/settings/widgets/settings_logout.dart';
import 'package:local_card_trading/src/feature/settings/widgets/settings_name.dart';
import 'package:local_card_trading/src/feature/settings/widgets/settings_password.dart';
import 'package:local_card_trading/src/feature/settings/widgets/settings_photo.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SettingsPhoto(),
          Divider(
            height: 32,
            color: Colors.transparent,
          ),
          SettingsEmail(),
          SettingsName(),
          SettingsPassword(),
          SettingsLogout(),
        ],
      ),
    );
  }
}
