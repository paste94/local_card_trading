import 'dart:async';
import 'dart:io';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:cache/cache.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:storage_repository/storage_repository.dart';

/// {@template sign_up_with_email_and_password_failure}
/// Thrown during the sign up process if a failure occurs.
/// {@endtemplate}
class SignUpWithEmailAndPasswordFailure implements Exception {
  /// {@macro sign_up_with_email_and_password_failure}
  const SignUpWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  /// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/createUserWithEmailAndPassword.html
  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
          'An account already exists for that email.',
        );
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
          'Please enter a stronger password.',
        );
      case 'network-request-failed':
        return const SignUpWithEmailAndPasswordFailure(
          'Unale to connect to the internet, please check your connection and retry',
        );
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }

  /// The associated error message.
  final String message;
}

/// {@template log_in_with_email_and_password_failure}
/// Thrown during the login process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithEmailAndPassword.html
/// {@endtemplate}
class LogInWithEmailAndPasswordFailure implements Exception {
  /// {@macro log_in_with_email_and_password_failure}
  const LogInWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    print('**************** ${code}');
    switch (code) {
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithEmailAndPasswordFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure(
          'Incorrect password, please try again.',
        );
      case 'network-request-failed':
        return const LogInWithEmailAndPasswordFailure(
          'Unale to connect to the internet, please check your connection and retry',
        );
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }

  /// The associated error message.
  final String message;
}

class UpdatePasswordFailure implements Exception {
  /// {@macro log_in_with_email_and_password_failure}
  const UpdatePasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory UpdatePasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const UpdatePasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const UpdatePasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const UpdatePasswordFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const UpdatePasswordFailure(
          'Incorrect password, please try again.',
        );
      case 'network-request-failed':
        return const UpdatePasswordFailure(
          'Unale to connect to the internet, please check your connection and retry',
        );
      default:
        return const UpdatePasswordFailure();
    }
  }
  final String message;
}

/// {@template log_in_with_google_failure}
/// Thrown during the sign in with google process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithCredential.html
/// {@endtemplate}
class LogInWithGoogleFailure implements Exception {
  /// {@macro log_in_with_google_failure}
  const LogInWithGoogleFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithGoogleFailure.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const LogInWithGoogleFailure(
          'Account exists with different credentials.',
        );
      case 'invalid-credential':
        return const LogInWithGoogleFailure(
          'The credential received is malformed or has expired.',
        );
      case 'operation-not-allowed':
        return const LogInWithGoogleFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'user-disabled':
        return const LogInWithGoogleFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithGoogleFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithGoogleFailure(
          'Incorrect password, please try again.',
        );
      case 'invalid-verification-code':
        return const LogInWithGoogleFailure(
          'The credential verification code received is invalid.',
        );
      case 'invalid-verification-id':
        return const LogInWithGoogleFailure(
          'The credential verification ID received is invalid.',
        );
      case 'network-request-failed':
        return const LogInWithGoogleFailure(
          'Unale to connect to the internet, please check your connection and retry',
        );
      default:
        return const LogInWithGoogleFailure();
    }
  }

  /// The associated error message.
  final String message;
}

class UpdateNameFailure implements Exception {
  final code;

  const UpdateNameFailure([
    this.message = 'An unknown exception occurred.',
    this.code,
  ]);

  factory UpdateNameFailure.fromCode(String code) {
    switch (code) {
      case 'requires-recent-login':
        return UpdateNameFailure(
          'Please reauthenticate',
          code,
        );
      case 'network-request-failed':
        return UpdateNameFailure(
          'No internet connection, please connect your device to the internet and retry',
          code,
        );

      default:
        return const UpdateNameFailure();
    }
  }

  final String message;
}

class UpdatePhotoFailure implements Exception {
  final code;

  const UpdatePhotoFailure([
    this.message = 'An unknown exception occurred.',
    this.code,
  ]);

  factory UpdatePhotoFailure.fromCode(String code) {
    switch (code) {
      case 'requires-recent-login':
        return UpdatePhotoFailure(
          'Please reauthenticate',
          code,
        );
      case 'network-request-failed':
        return UpdatePhotoFailure(
          'No internet connection, please connect your device to the internet and retry',
          code,
        );

      default:
        return const UpdatePhotoFailure();
    }
  }

  final String message;
}

/// Thrown during the logout process if a failure occurs.
class LogOutFailure implements Exception {
  final String message;

  const LogOutFailure([
    this.message = 'Log out exception occurred.',
  ]);
}

/// {@template authentication_repository}
/// Repository which manages user authentication.
/// {@endtemplate}
class NavigationRepository {
  /// {@macro authentication_repository}
  NavigationRepository({
    CacheClient? cache,
    firebase_auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  }) {
    _cache = cache ?? CacheClient();
    firebase_auth.FirebaseAuth.instance.useAuthEmulator('127.0.0.1', 9099);
    _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;
    _googleSignIn = googleSignIn ?? GoogleSignIn.standard();
  }

  late CacheClient _cache;
  late firebase_auth.FirebaseAuth _firebaseAuth;
  late GoogleSignIn _googleSignIn;
  final _storageRepository = StorageRepository();

  /// Whether or not the current environment is web
  /// Should only be overridden for testing purposes. Otherwise,
  /// defaults to [kIsWeb]
  @visibleForTesting
  bool isWeb = kIsWeb;

  /// User cache key.
  /// Should only be used for testing purposes.
  @visibleForTesting
  static const userCacheKey = '__user_cache_key__';

  /// Stream of [User] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [User.empty] if the user is not authenticated.
  Stream<User> get user {
    return _firebaseAuth.userChanges().map((firebaseUser) {
      final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
      _cache.write(key: userCacheKey, value: user);
      return user;
    });
  }

  /// Returns the current cached user.
  /// Defaults to [User.empty] if there is no cached user.
  User get currentUser {
    return _cache.read<User>(key: userCacheKey) ?? User.empty;
  }

  /// Creates a new user with the provided [email] and [password].
  ///
  /// Throws a [SignUpWithEmailAndPasswordFailure] if an exception occurs.
  Future<void> signUp({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      print('************* ${e}');
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  /// Starts the Sign In with Google Flow.
  ///
  /// Throws a [LogInWithGoogleFailure] if an exception occurs.
  Future<void> logInWithGoogle() async {
    try {
      late final firebase_auth.AuthCredential credential;
      if (isWeb) {
        final googleProvider = firebase_auth.GoogleAuthProvider();
        final userCredential = await _firebaseAuth.signInWithPopup(
          googleProvider,
        );
        credential = userCredential.credential!;
      } else {
        final googleUser = await _googleSignIn.signIn();
        if (googleUser != null) {
          final googleAuth = await googleUser.authentication;
          credential = firebase_auth.GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );
          await _firebaseAuth.signInWithCredential(credential);
        }
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      print('FirebaseAuthException: ${e}');
      throw LogInWithGoogleFailure.fromCode(e.code);
    } catch (e, stackTrace) {
      print('Exception: ${stackTrace}');
      throw const LogInWithGoogleFailure();
    }
  }

  /// Signs in with the provided [email] and [password].
  ///
  /// Throws a [LogInWithEmailAndPasswordFailure] if an exception occurs.
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      print('************* ${e}');
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  /// Signs out the current user which will emit
  /// [User.empty] from the [user] Stream.
  ///
  /// Throws a [LogOutFailure] if an exception occurs.
  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } catch (_) {
      throw LogOutFailure();
    }
  }

  Future<void> updateUserName(String newName) async {
    try {
      await _firebaseAuth.currentUser?.updateDisplayName(newName);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw UpdateNameFailure.fromCode(e.code);
    } catch (_) {
      throw const UpdateNameFailure();
    }
  }

  Future<void> updatePassword(
    String currentPassword,
    String newPassword,
  ) async {
    if (_firebaseAuth.currentUser == null ||
        _firebaseAuth.currentUser!.email == null) {
      throw UpdatePasswordFailure.fromCode('user-not-found');
    }
    try {
      final credential = firebase_auth.EmailAuthProvider.credential(
        email: _firebaseAuth.currentUser!.email!,
        password: currentPassword,
      );
      await _firebaseAuth.currentUser?.reauthenticateWithCredential(credential);
      await _firebaseAuth.currentUser?.updatePassword(newPassword);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw UpdatePasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const UpdatePasswordFailure();
    }
  }

  Future<void> updateImage(
    File newImage,
  ) async {
    if (_firebaseAuth.currentUser == null ||
        _firebaseAuth.currentUser!.email == null) {
      print('NOT FOUND ERROR');
      throw UpdatePhotoFailure.fromCode('user-not-found');
    }
    try {
      final downloadURL = await _storageRepository.loadUserPhotoProfile(
        file: newImage,
        userID: _firebaseAuth.currentUser!.uid,
      );
      await _firebaseAuth.currentUser!.updatePhotoURL(downloadURL);
    } on firebase_auth.FirebaseAuthException catch (e) {
      print('AUTH ERROR $e');
      throw UpdatePhotoFailure.fromCode(e.code);
    } catch (e) {
      print('GENERIC ERROR $e');
      throw const UpdatePhotoFailure();
    }
  }
}

extension on firebase_auth.User {
  User get toUser {
    return User(
      id: uid,
      email: email,
      name: displayName,
      photo: photoURL,
      loginMethods: providerData.map((profile) => profile.providerId).toList(),
    );
  }
}
