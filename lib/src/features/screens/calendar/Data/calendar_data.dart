import 'package:cloud_firestore/cloud_firestore.dart';

class Calendar {
  final String userId;
  final String title;
  Calendar({required this.title, required this.userId});

  factory Calendar.fromFiretore(DocumentSnapshot doc) {
    if (!doc.exists) throw ArgumentError('kacke');

    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Calendar(
      userId: doc.id,
      title: data['title'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {'title': title};
  }
}
