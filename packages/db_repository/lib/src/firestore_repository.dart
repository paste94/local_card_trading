import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreRepository {
  FirestoreRepository() {
    // TODO: Remove this for production
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8081);
    var db = FirebaseFirestore.instance;
  }
}
