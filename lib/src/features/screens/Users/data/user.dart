import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  String userId;
  String firstName;
  String lastName;

  bool isAdmin = false;

  Users({required this.userId, required this.firstName, required this.lastName, required this.isAdmin});

  factory Users.fromFirestore(DocumentSnapshot doc) {
    if (!doc.exists) throw ArgumentError('mist schief gelaufen');

    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Users(
      userId: doc.id,
      firstName: data['firstName'] as String,
      lastName: data['lastName'] as String,
      isAdmin: data['isAdmin'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    return {'firstName': firstName, 'lastName': lastName, 'isAdmin': isAdmin};
  }
}
