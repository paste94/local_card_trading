import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreRepository {
  FirestoreRepository() {
    // TODO: Remove this line in production
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8081);
    db = FirebaseFirestore.instance;
  }

  late final db;

  Future<void> saveCard(Map<String, dynamic> myMtgCard) async {
    await db.collection("cards").add(myMtgCard);
    // .onError((e, _) => print("Error writing document: $e"));
  }
}
