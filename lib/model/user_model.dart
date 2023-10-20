import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  bool? isVerified;
  final String? email;
  String? password;
  final String? displayName;
  DateTime? birthDate;
  UserModel(
      {this.uid,
      this.email,
      this.password,
      this.displayName,
      this.birthDate,
      this.isVerified});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'displayName': displayName,
      'birthDate': birthDate,
    };
  }

  UserModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : uid = doc.id,
        email = doc.data()!["email"],
        displayName = doc.data()!["displayName"],
        birthDate = doc.data()!["birthDate"];

  UserModel copyWith({
    bool? isVerified,
    String? uid,
    String? email,
    String? password,
    String? displayName,
    DateTime? birthDate,
  }) {
    return UserModel(
        uid: uid ?? this.uid,
        email: email ?? this.email,
        password: password ?? this.password,
        displayName: displayName ?? this.displayName,
        birthDate: birthDate ?? this.birthDate,
        isVerified: isVerified ?? this.isVerified);
  }
}
