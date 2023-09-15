import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/foundation.dart';

/// Classe che rappresenta l'utente. Viene usata per fare in modo che il
/// Service non lavori direttamente con Firebase. Espone il isEmailVerified
/// perchè ad ora è l'unico elemento di interese per lo user.
@immutable
class AuthUser {
  final String? uid;
  final String? displayName;
  final String? email;
  final String? photoURL;
  const AuthUser({
    required this.uid,
    required this.displayName,
    required this.email,
    required this.photoURL,
  });

  // Questo permette di creare una sorta di override del costruttore. Prende
  // come parametro l'user e crea una istanza di AuthUser guardando la
  // emailVerified dello user passato come parametro
  factory AuthUser.fromFirebase(User user) => AuthUser(
        uid: user.uid,
        displayName: user.displayName,
        email: user.email,
        photoURL: user.photoURL,
      );
}
