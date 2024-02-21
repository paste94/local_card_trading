import 'dart:io';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/core/widgets/image_picker.dart';
import 'package:local_card_trading/src/feature/auth/providers/authentication/authentication_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPhoto extends ConsumerStatefulWidget {
  const SettingsPhoto({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsPhotoState();
}

class _SettingsPhotoState extends ConsumerState<SettingsPhoto> {
  final _avatarSize = 48.0;
  final _buttonSize = 17.0;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        height: 100,
        width: 100,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(_avatarSize),
          child: CachedNetworkImage(
            imageUrl: ref.watch(authenticationProvider).user!.photo ?? '',
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
            onPressed: () async {
              File? imgFile = await showImagePickerModal(context: context);
              if (imgFile != null) {
                ref
                    .read(authenticationProvider.notifier)
                    .userUpdatePhoto(imgFile)
                    .catchError((error) => {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(error is UpdatePhotoFailure
                                ? error.message
                                : AppLocalizations.of(context)!.auth_error),
                          ))
                        });
              }
            },
            // onPressed: () => showImagePickerModal(context: context).then(
            //   (imgFile) => ref
            //       .read(authenticationProvider.notifier)
            //       .userUpdatePhoto(imgFile),
            // ),
          ),
        ),
      )
    ]);
  }
}
