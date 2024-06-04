import 'package:cloud_firestore/cloud_firestore.dart';

class WorkPlace {
  String workPlaceId;
  final String title;

  WorkPlace({required this.workPlaceId, required this.title});

  factory WorkPlace.fromFirestore(DocumentSnapshot doc) {
    if (!doc.exists) throw ArgumentError('schief gelaufen');

    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return WorkPlace(workPlaceId: doc.id, title: data['title'] as String);
  }
  Map<String, dynamic> toMap() {
    return {'title': title};
  }
}
