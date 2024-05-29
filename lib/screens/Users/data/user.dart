import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String firstName;
  String lastName;

  bool isAdmin = false;

  User({required this.firstName, required this.lastName, required this.isAdmin});

  factory User.fromFirestore(DocumentSnapshot doc) {
    if (!doc.exists) throw ArgumentError('mist schief gelaufen');

    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return User(
      firstName: data['firstName'] as String,
      lastName: data['lastName'] as String,
      isAdmin: data['isAdmin'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    return {'firstName': firstName, 'lastName': lastName, 'isAdmin': isAdmin};
  }
}
