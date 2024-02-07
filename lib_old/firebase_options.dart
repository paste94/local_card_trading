// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA4FAVry4BMfuEJeVgghpHNtcHluw4qieY',
    appId: '1:517582488644:web:4841188e97a52c0a822811',
    messagingSenderId: '517582488644',
    projectId: 'localcardtrading',
    authDomain: 'localcardtrading.firebaseapp.com',
    storageBucket: 'localcardtrading.appspot.com',
    measurementId: 'G-9LXP269974',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDCx7rFjTLJw4oliVnh5f32Xpkoz1gOxhI',
    appId: '1:517582488644:android:44704ec020b16f5d822811',
    messagingSenderId: '517582488644',
    projectId: 'localcardtrading',
    storageBucket: 'localcardtrading.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD_lX8E7rvIVwtl4jK5gGABgtlv4jqwhrc',
    appId: '1:517582488644:ios:f4745430c55471bf822811',
    messagingSenderId: '517582488644',
    projectId: 'localcardtrading',
    storageBucket: 'localcardtrading.appspot.com',
    iosBundleId: 'com.example.localCardTrading',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD_lX8E7rvIVwtl4jK5gGABgtlv4jqwhrc',
    appId: '1:517582488644:ios:9a98b440337ac8b5822811',
    messagingSenderId: '517582488644',
    projectId: 'localcardtrading',
    storageBucket: 'localcardtrading.appspot.com',
    iosBundleId: 'com.example.localCardTrading.RunnerTests',
  );
}