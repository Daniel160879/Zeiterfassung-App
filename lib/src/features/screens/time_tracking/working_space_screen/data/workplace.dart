import 'package:cloud_firestore/cloud_firestore.dart';

class WorkPlace {
  String workPlaceId;
  final String title;
  final int pricePerHour;

  WorkPlace({required this.workPlaceId, required this.title, required this.pricePerHour});

  factory WorkPlace.fromFirestore(DocumentSnapshot doc) {
    if (!doc.exists) throw ArgumentError('schief gelaufen');

    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return WorkPlace(
      workPlaceId: doc.id,
      title: data['title'] as String,
      pricePerHour: data['pricePerHour'] as int,
    );
  }
  Map<String, dynamic> toMap() {
    return {'title': title, 'pricePerHour': pricePerHour};
  }
}
