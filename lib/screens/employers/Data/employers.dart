import 'package:cloud_firestore/cloud_firestore.dart';

class Employer {
  String firstName;
  String lastName;

  Employer({
    required this.firstName,
    required this.lastName,
  });

  factory Employer.fromFirestore(DocumentSnapshot doc) {
    if (!doc.exists) throw ArgumentError('mist schief gelaufen');

    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Employer(
      firstName: data['firstName'] as String,
      lastName: data['lastName'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
    };
  }
}
