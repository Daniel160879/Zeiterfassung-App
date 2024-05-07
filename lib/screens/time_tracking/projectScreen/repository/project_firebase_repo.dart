import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/data/project.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/repository/project_repository.dart';

class FirebaseProjectRepository implements ProjectRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> deleteProjects(projects) {
    // TODO: implement deleteProjects
    throw UnimplementedError();
  }

  @override
  List<Project> fromJson(String json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Future<List<Project>> loadProjects() {
    // TODO: implement loadProjects
    throw UnimplementedError();
  }

  @override
  Future<void> saveProjects(List<Project> projects) {
    // TODO: implement saveProjects
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson(List<Project> projects) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
