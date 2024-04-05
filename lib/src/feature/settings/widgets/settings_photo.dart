import 'dart:io';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/core/widgets/image_picker.dart';
import 'package:local_card_trading/src/core/navigation/navigation_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPhoto extends ConsumerStatefulWidget {
  const SettingsPhoto({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsPhotoState();
}

class _SettingsPhotoState extends ConsumerState<SettingsPhoto> {
  final _avatarSize = 48.0;
  final _buttonSize = 17.0;
  final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    final ScaffoldMessengerState? scaffold = _scaffoldKey.currentState;

    return Stack(children: [
      SizedBox(
        height: 100,
        width: 100,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(_avatarSize),
          child: CachedNetworkImage(
            imageUrl: ref.watch(navigationProvider).user!.photo ?? '',
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
              File? imgFile;
              try {
                imgFile = await showImagePickerModal(context: context);
              } catch (error) {
                scaffold?.showSnackBar(SnackBar(
                  content: Text(error.toString()),
                ));
              }
              if (imgFile != null) {
                ref
                    .read(navigationProvider.notifier)
                    .userUpdatePhoto(imgFile)
                    .catchError((error) => {
                          scaffold?.showSnackBar(SnackBar(
                            content: Text(error is UpdatePhotoFailure
                                ? error.message
                                : AppLocalizations.of(context)!.auth_error),
                          ))
                        });
              }
            },
            // onPressed: () => showImagePickerModal(context: context).then(
            //   (imgFile) => ref
            //       .read(navigationProvider.notifier)
            //       .userUpdatePhoto(imgFile),
            // ),
          ),
        ),
      )
    ]);
  }
}
