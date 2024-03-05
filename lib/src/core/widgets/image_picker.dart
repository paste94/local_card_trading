import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_card_trading/constants/constants.dart';

const _modalButtonSize = 30.0;

Future<File?> _cropImage({
  required context,
  required from,
}) async {
  XFile? image = await ImagePicker().pickImage(
      source: from,
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
    aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
    uiSettings: [
      AndroidUiSettings(
        toolbarTitle: 'Cropper',
        toolbarColor: Colors.deepOrange,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: true,
      ),
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
                  onPressed: () => _cropImage(
                    context: context,
                    from: ImageSource.camera,
                  )
                      .then((img) => pickedImage = img)
                      .then((_) => Navigator.of(context).pop()),
                ),
              ),
              const Text('Camera'),
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
                  onPressed: () => _cropImage(
                    context: context,
                    from: ImageSource.gallery,
                  )
                      .then((img) => pickedImage = img)
                      .then((_) => Navigator.of(context).pop()),
                ),
              ),
              const Text('Gallery'),
            ],
          ),
        ],
      ),
    ),
  );

  return pickedImage;
}
