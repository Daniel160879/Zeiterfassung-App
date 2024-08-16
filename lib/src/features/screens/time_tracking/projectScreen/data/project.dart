import 'package:cloud_firestore/cloud_firestore.dart';

class Project {
  String projectId;
  final String title;

  Project({required this.title, required this.projectId});

  factory Project.fromFirestore(DocumentSnapshot doc) {
    if (!doc.exists) throw ArgumentError('mist schief gelaufen');

    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Project(projectId: doc.id, title: data['title'] as String);
  }

  Map<String, dynamic> toMap() {
    return {'title': title};
  }
}
