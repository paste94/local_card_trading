import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:local_card_trading/services/auth/auth_exceptions.dart';
import 'package:local_card_trading/services/auth/auth_provider.dart';
import 'package:local_card_trading/services/auth/auth_user.dart';

import '../../firebase_options.dart';

/// Implementazione del provider. Questa comunica direttamente con Firebase e
/// effettua tutti i controlli nel caso ci siano errori o null sparsi in giro.
class FirebaseAuthProvider implements AuthProvider {
  @override
  Future<void> initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = currentUser;
    if (user != null) {
      return user;
    } else {
      throw UserNotLoggedInAuthException();
    }
  }

  @override
  AuthUser? get currentUser {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return AuthUser.fromFirebase(user);
    } else {
      return null;
    }
  }

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = currentUser;
    if (user != null) {
      return user;
    } else {
      throw UserNotLoggedInAuthException();
    }
  }

  @override
  Future<void> logOut() async {
    if (FirebaseAuth.instance.currentUser != null) {
      await FirebaseAuth.instance.signOut();
    } else {
      throw UserNotLoggedInAuthException();
    }
  }

  @override
  Future<void> sendEmailVerification() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.sendEmailVerification();
    } else {
      throw UserNotLoggedInAuthException();
    }
  }
}
