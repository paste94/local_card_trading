import 'dart:io';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_card_trading/constants/constants.dart';

const _modalButtonSize = 30.0;

Future<File?> _pickImage({
  required context,
  required from,
}) async {
  var source =
      from == ImageSourceType.camera ? ImageSource.camera : ImageSource.gallery;
  XFile? image = await ImagePicker().pickImage(
      source: source,
      imageQuality: 50,
      preferredCameraDevice: CameraDevice.front);
  if (image == null) {
    return null;
  }
  CroppedFile? croppedImage = await ImageCropper().cropImage(
    sourcePath: image.path,
    aspectRatioPresets: [
      CropAspectRatioPreset.square,
    ],
    cropStyle: CropStyle.circle,
    aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
    uiSettings: [
      AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      IOSUiSettings(
        title: 'Cropper',
      ),
      WebUiSettings(
        context: context,
      ),
    ],
  );

  return croppedImage == null ? null : File(croppedImage.path);
}

Future<File?> showImagePickerModal({
  required BuildContext context,
}) async {
  File? pickedImage;

  await showModalBottomSheet(
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
                backgroundColor: const Color.fromARGB(255, 202, 47, 20),
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
                  onPressed: () => _pickImage(
                    context: context,
                    from: ImageSourceType.gallery,
                  )
                      .then((img) => pickedImage = img)
                      .then((_) => Navigator.of(context).pop()),
                ),
              ),
              Text('Gallery'),
            ],
          ),
        ],
      ),
    ),
  );

  return pickedImage;
}
