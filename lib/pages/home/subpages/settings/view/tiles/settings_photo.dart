import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_card_trading/app/bloc/app_bloc.dart';
import 'package:local_card_trading/constants/constants.dart';
import 'package:local_card_trading/pages/home/widgets/image_picker.dart';

class SettingsPhoto extends StatefulWidget {
  const SettingsPhoto({super.key});

  @override
  State<SettingsPhoto> createState() => _SettingsPhotoState();
}

class _SettingsPhotoState extends State<SettingsPhoto> {
  final _avatarSize = 48.0;
  final _buttonSize = 17.0;
  final _modalButtonSize = 30.0;

  void _openGalleryPicker() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ImageFromGalleryEx(ImageSourceType.gallery)));
  }

  void _showModalPickerMethod() {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (context) => FractionallySizedBox(
        heightFactor: 0.3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: _modalButtonSize,
                  backgroundColor: Color.fromARGB(255, 202, 47, 20),
                  child: IconButton(
                    icon: const Icon(
                      Icons.camera_alt,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                ),
                Text('Camera'),
              ],
            ),
            const VerticalDivider(
              color: Colors.transparent,
              width: 40,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: _modalButtonSize,
                  backgroundColor: const Color.fromARGB(255, 0, 142, 213),
                  child: IconButton(
                    icon: const Icon(
                      Icons.photo,
                      color: Colors.black,
                    ),
                    onPressed: _openGalleryPicker,
                  ),
                ),
                Text('Gallery'),
              ],
            ),
          ],
        ),
      ),
    );
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
              onPressed: _showModalPickerMethod,
            ),
          ),
        )
      ],
    );
  }
}
