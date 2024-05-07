//import 'package:cloud_firestore/cloud_firestore.dart';

class Project {
  //String id;
  String title;

  Project({
    //required this.id,
    required this.title,
  });

  /// Takes a data structure from firestore and creates a Todo object.
  //factory Project.fromFirestore(DocumentSnapshot doc) {
  //if (!doc.exists) throw ArgumentError('Document is empty');

  //final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  //return Project(
  //  id: doc.id,
  //  title: data['title'] as String);
  //}

  /// Gibt NICHT die ID mit zurück. Diese soll automatisch generiert werden.
  //Map<String, dynamic> toMap() {
  //return {'title': title};
  //}

  /// FROMJSON
  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(title: json['title']);
  }

  /// TOJSON
  Map<String, dynamic> toJson() {
    return {'title': title};
  }
}
