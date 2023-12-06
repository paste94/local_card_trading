import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_card_trading/app/bloc/app_bloc.dart';
import 'package:local_card_trading/pages/home/widgets/image_picker.dart';

class SettingsPhoto extends StatefulWidget {
  const SettingsPhoto({super.key});

  @override
  State<SettingsPhoto> createState() => _SettingsPhotoState();
}

class _SettingsPhotoState extends State<SettingsPhoto> {
  final _avatarSize = 48.0;
  final _buttonSize = 17.0;

  void _getImage(User user) {
    showImagePickerModal(
      context: context,
    ).then((imgFile) {
      if (imgFile != null) {
        context.read<AppBloc>().add(AppUserUpdatePhoto(imgFile));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final User user = context.select((AppBloc bloc) => bloc.state.user);

    return Stack(
      children: [
        CircleAvatar(
          radius: _avatarSize,
          backgroundImage:
              user.photo != null ? NetworkImage(user.photo!) : null,
          child: user.photo == null
              ? Icon(Icons.person_outline, size: _avatarSize)
              : null,
        ),
        Positioned(
          right: 0,
          top: 60,
          child: CircleAvatar(
            radius: _buttonSize,
            backgroundColor: const Color(0xff94d500),
            child: IconButton(
              icon: Icon(
                Icons.camera_alt,
                size: _buttonSize - 2,
                color: Colors.black,
              ),
              onPressed: () => _getImage(user),
            ),
          ),
        )
      ],
    );
  }
}
