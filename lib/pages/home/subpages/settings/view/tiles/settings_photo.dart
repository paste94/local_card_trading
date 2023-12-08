import 'package:authentication_repository/authentication_repository.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_card_trading/app/bloc/app_bloc.dart';
import 'package:local_card_trading/pages/home/bloc/home_bloc.dart';
import 'package:local_card_trading/pages/home/widgets/image_picker.dart';
import 'package:local_card_trading/pages/pic_details/view/pic_details.dart';
import 'package:photo_view/photo_view.dart';

class SettingsPhoto extends StatefulWidget {
  const SettingsPhoto({super.key});

  @override
  State<SettingsPhoto> createState() => _SettingsPhotoState();
}

class _SettingsPhotoState extends State<SettingsPhoto> {
  final _avatarSize = 48.0;
  final _buttonSize = 17.0;

  void _getImage() {
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
        GestureDetector(
          onTap: () {
            context.read<HomeBloc>().add(const AppUserSelectPicDetails(true));
          },
          child: Hero(
            tag: 'profile_img_tag',
            child: SizedBox(
              height: 100,
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(_avatarSize),
                child: CachedNetworkImage(
                  imageUrl: user.photo ?? '',
                  placeholder: (_, __) => const CircularProgressIndicator(),
                  errorWidget: (_, __, ___) => const ColoredBox(
                    color: Colors.amber,
                    child: Icon(
                      Icons.person,
                    ),
                  ),
                ),
              ),
            ),
          ),
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
              onPressed: _getImage,
            ),
          ),
        )
      ],
    );
  }
}
