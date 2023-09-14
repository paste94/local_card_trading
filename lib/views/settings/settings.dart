import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_card_trading/constants/routes.dart';
import 'package:local_card_trading/services/auth/auth_service.dart';
import 'package:local_card_trading/services/auth/auth_user.dart';
import 'package:local_card_trading/utils/dialogs.dart';
import 'package:local_card_trading/utils/settings/list_item.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final AuthUser _authUser = AuthService.firebase().currentUser!;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.user_settings),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            tiles: [
              const SpacingTile(
                height: 10,
              ),
              SettingsTile.navigation(
                onPressed: (context) async {
                  await showModalBottomSheet(
                      context: context, builder: modalBottomSheetBuilder);
                },
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(_authUser.photoURL ?? ''),
                ),
                title: Text("Tap to edit image"),
              ),
              const SpacingTile(
                height: 5,
              ),
              DividerTile(),
              SettingsTile.navigation(
                title: Text(AppLocalizations.of(context)!.logout),
                leading: const Icon(Icons.logout),
                onPressed: (context) => showConfirmDialog(
                  context: context,
                  title: AppLocalizations.of(context)!.logoud_dialog_title,
                  text: AppLocalizations.of(context)!.logoud_dialog_text,
                  onAcceptPressed: () => AuthService.firebase().logOut().then(
                        (value) =>
                            Navigator.of(context).pushNamedAndRemoveUntil(
                          ROUTE_LOGIN,
                          (route) => false,
                        ),
                      ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget modalBottomSheetBuilder(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                child: const Icon(Icons.camera_alt),
                onPressed: () => _picker.pickImage(source: ImageSource.camera),
              ),
              const SizedBox(height: 8),
              Text('Camersssa'),
            ],
          ),
          const SizedBox(width: 80),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                child: Icon(Icons.photo),
                onPressed: () => _picker.pickImage(source: ImageSource.gallery),
              ),
              const SizedBox(height: 8),
              Text('Gallery'),
            ],
          ),
        ],
      ),
    );
  }
}
                  // final XFile? photo =
                  //     await _picker.pickImage(source: ImageSource.camera);
                  // XFile? image =
                  //     await _picker.pickImage(source: ImageSource.gallery);
