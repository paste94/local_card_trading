import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class LoadImageFailure implements Exception {
  const LoadImageFailure({
    this.message = 'Unknown loading image failure',
  });

  factory LoadImageFailure.fromCode(String code) {
    switch (code) {
      default:
        return const LoadImageFailure();
    }
  }

  final String message;
}

class StorageRepository {
  StorageRepository();
  final storageRef = FirebaseStorage.instance.ref();

  Future<String?> loadUserPhotoProfile({
    required File file,
    required String userID,
  }) async {
    final storagePath = storageRef.child('${userID}/profile.png');
    try {
      await storagePath.putFile(file);
      print('STORAGE PATH ${storagePath.getDownloadURL()}');
      return storagePath.getDownloadURL();
    } on FirebaseException catch (e) {
      throw LoadImageFailure.fromCode(e.code);
    } catch (_) {
      throw LoadImageFailure();
    }
  }
}
