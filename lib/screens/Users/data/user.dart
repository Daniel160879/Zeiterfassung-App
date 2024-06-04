import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String userId;
  String firstName;
  String lastName;

  bool isAdmin = false;

  User({required this.userId, required this.firstName, required this.lastName, required this.isAdmin});

  factory User.fromFirestore(DocumentSnapshot doc) {
    if (!doc.exists) throw ArgumentError('mist schief gelaufen');

    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return User(
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
