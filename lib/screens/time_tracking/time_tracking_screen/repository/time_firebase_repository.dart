import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/data/project.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/time_tracking_screen/data/working_time.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/time_tracking_screen/repository/time_repository.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/working_space_screen/data/workplace.dart';

class FirebaseTimeRepository implements TimeRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<List<WorkingTime>> get workTimes {
    final workTimesCollectionRef = _firestore.collection('worktimes');
    final workTimesSnapshot = workTimesCollectionRef.snapshots();
    final workTimesStream =
        workTimesSnapshot.map((snapshot) => snapshot.docs.map((e) => WorkingTime.fromFirestore(e)).toList());
    return workTimesStream;
  }

  @override
  Future<void> deleteWorkPlace(WorkingTime workingTime) async {
    await FirebaseFirestore.instance.collection('worktimes').where('worktimes', isEqualTo: workingTime).get().then(
          (snapshot) => snapshot.docs.forEach(
            (doc) {
              doc.reference.delete();
            },
          ),
        );
  }

  @override
  Future<void> setWorkTimeComplitionToUser(
      WorkingTime workingTime, Project project, String userId, WorkPlace workPlace) async {
    await _firestore
        .collection('user')
        .doc(userId)
        .collection('projects')
        .doc(project.projectId)
        .collection('workplaces')
        .doc(workPlace.workPlaceId)
        .collection('worktimes')
        .doc()
        .set(workingTime.toMap());
  }
}
