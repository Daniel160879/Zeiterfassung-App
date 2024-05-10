import 'package:cloud_firestore/cloud_firestore.dart';

class Project {
  String id;
  final String title;

  Project({required this.title, required this.id});

  factory Project.fromFirestore(DocumentSnapshot doc) {
    if (!doc.exists) throw ArgumentError('mist schief gelaufen');

    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Project(id: doc.id, title: data['title'] as String);
  }

  Map<String, dynamic> toMap() {
    return {'title': title};
  }
}
