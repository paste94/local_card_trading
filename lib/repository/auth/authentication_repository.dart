import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:local_card_trading/model/user_model.dart';
import 'package:local_card_trading/services/auth/authentication_service.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  // TODO: Qui usa dependency injection: Fai in modo che service e dbService
  // vengano istanziati da fuori e gli oggetti vengano poi passati come
  // parametro. Questo consente al repo di essere totalemten agnostico sul tipo
  // di servizio da usare (utile per mock)
  AuthenticationService service = AuthenticationService();
  //DatabaseService dbService = DatabaseService();

  @override
  Stream<UserModel> getCurrentUser() {
    return service.retrieveCurrentUser();
  }

  @override
  Future<UserCredential?> signUp(UserModel user) {
    try {
      return service.signUp(user);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<UserCredential?> signIn(UserModel user) {
    try {
      return service.signIn(user);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<void> signOut() {
    return service.signOut();
  }

  @override
  Future<String?> retrieveUserName(UserModel user) {
    //TODO: Rivedi sta parte
    return Future(() => 'Helloooooo');
  }
}

abstract class AuthenticationRepository {
  Stream<UserModel> getCurrentUser();
  Future<UserCredential?> signUp(UserModel user);
  Future<UserCredential?> signIn(UserModel user);
  Future<void> signOut();
  Future<String?> retrieveUserName(UserModel user);
}
