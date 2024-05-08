import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/data/project.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/repository/project_repository.dart';

class FirebaseProjectRepository implements ProjectRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<List<Project>> get project {
    final projectCollectionRef = _firestore.collection('title');
    final projectSnapshot = projectCollectionRef.snapshots();
    final projectStream =
        projectSnapshot.map((snapshot) => snapshot.docs.map((e) => Project.fromFirestore(e)).toList());
    return projectStream;
  }

  @override
  void deletProject(Project project) {
    final projectCollectionRef = _firestore.collection('title');
    projectCollectionRef.doc(project.title).delete();
  }

  @override
  // TODO: implement project

  @override
  void resetProject() {
    // TODO: implement resetProject
  }

  @override
  Future<void> setProjectCompletion(Project project) {
    // TODO: implement setProjectCompletion
    throw UnimplementedError();
  }
}
