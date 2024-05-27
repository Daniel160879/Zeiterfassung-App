import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/data/project.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/repository/project_repository.dart';

class FirebaseProjectRepository implements ProjectRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<List<Project>> get project {
    final projectCollectionRef = _firestore.collection('projects');
    final projectSnapshot = projectCollectionRef.snapshots();
    final projectStream =
        projectSnapshot.map((snapshot) => snapshot.docs.map((e) => Project.fromFirestore(e)).toList());
    return projectStream;
  }

  @override
  Future<void> deletProject(Project project) async {
    await FirebaseFirestore.instance
        .collection('projects')
        .where('title', isEqualTo: project.title)
        .get()
        .then((snapshot) => snapshot.docs.forEach((doc) {
              doc.reference.delete();
            }));
  }

  @override
  void resetProject() {
    final projectCollectionRef = _firestore.collection('projects');
    projectCollectionRef.get().then((snapshot) {
      for (final doc in snapshot.docs) {
        doc.reference.delete();
      }
    });
  }

  @override
  Future<void> setProjectCompletion(Project project) async {
    final projectCollectionRef = _firestore.collection('projects');
    final docRef = projectCollectionRef.doc();
    await docRef.set(project.toMap());
    project.id = docRef.id;
  }
}
