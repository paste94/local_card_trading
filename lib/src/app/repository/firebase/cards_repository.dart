import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:local_card_trading/src/app/classes/my_mtg_card.dart';

var db = FirebaseFirestore.instance;

// Future<void> saveMyMtgCard({required MyMtgCard myMtgCard}) async {
//   myMtgCard
//   await db
//       .collection("cards")
//       .doc()
//       .set()
//       .onError((e, _) => print("Error writing document: $e"));
// }
