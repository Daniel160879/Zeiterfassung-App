import 'package:cloud_firestore/cloud_firestore.dart';

class WorkPlace {
  String id;
  final String title;

  WorkPlace({required this.id, required this.title});

  factory WorkPlace.fromFirestore(DocumentSnapshot doc) {
    if (!doc.exists) throw ArgumentError('schief gelaufen');

    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return WorkPlace(id: doc.id, title: data['title'] as String);
  }
  Map<String, dynamic> toMap() {
    return {'title': title};
  }
}
