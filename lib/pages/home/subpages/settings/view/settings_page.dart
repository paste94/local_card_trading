import 'package:authentication_repository/authentication_repository.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_card_trading/app/bloc/app_bloc.dart';
import 'package:local_card_trading/pages/home/home.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final User user = context.select((AppBloc bloc) => bloc.state.user);
    const _avatarSize = 48.0;
    const _buttonSize = 17.0;

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: _avatarSize,
                backgroundImage:
                    user.photo != null ? NetworkImage(user.photo!) : null,
                child: user.photo == null
                    ? const Icon(Icons.person_outline, size: _avatarSize)
                    : null,
              ),
              Positioned(
                right: 0,
                top: 60,
                child: CircleAvatar(
                  radius: _buttonSize,
                  backgroundColor: Color(0xff94d500),
                  child: IconButton(
                    icon: Icon(
                      Icons.search,
                      size: _buttonSize - 2,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      print('object');
                    },
                  ),
                ),
              )
            ],
          ),
          // ClipOval(
          //   child: icon.photo == null ? Image(image: AssetImage('assets/user_photo.png')) : NetworkImage(url),
          // )
          Text(user.email ?? ''),
        ],
      ),
    );
    // SettingsList(sections: [
    //   SettingsSection(
    //     title: Text('Account'),
    //     tiles: [
    //       SettingsTile(
    //         leading: Icon(Icons.logout),
    //         title: Text('Logout'),
    //         onPressed: _logout,
    //       ),
    //     ],
    //   ),
    // ]);
  }

  void _logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm?'),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel')),
            TextButton(
                onPressed: () {
                  context.read<AppBloc>().add(const AppLogoutRequested());
                  Navigator.of(context).pop();
                },
                child: const Text('Logout'))
          ],
        );
      },
    );
  }
}
