import 'package:cloud_firestore/cloud_firestore.dart';

class Project {
  final String title;

  Project({
    required this.title,
  });

  factory Project.fromFirestore(DocumentSnapshot doc) {
    if (!doc.exists) throw ArgumentError('mist schief gelaufen');

    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Project(title: data['title'] as String);
  }

  Map<String, dynamic> toMap() {
    return {'title': title};
  }

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(title: json['title']);
  }

  Map<String, dynamic> toJson() {
    return {'title': title};
  }
}
