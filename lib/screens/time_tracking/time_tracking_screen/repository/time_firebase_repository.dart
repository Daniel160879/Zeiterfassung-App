import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/time_tracking_screen/data/working_time.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/time_tracking_screen/repository/time_repository.dart';

class FirebaseTimeRepository implements TimeRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<List<WorkingTime>> getWorktimesStream(
    String userId,
  ) {
    return _firestore.collection('user').doc(userId).collection('worktimes').snapshots().map((snapshot) =>
        snapshot.docs.map((e) => WorkingTime.fromFirestore(e)).toList()
          ..sort((a, b) => a.workday.compareTo(b.workday)));
  }

  @override
  Future<void> deleteWorkTime(WorkingTime workingTime, String userId) async {
    await _firestore
        .collection('user')
        .doc(userId)
        .collection('worktimes')
        .where('worktimes', isEqualTo: workingTime)
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach(
            (doc) {
              doc.reference.delete();
            },
          ),
        );
  }

  @override
  Future<void> setWorkTimeComplitionToUser(WorkingTime workingTime, String userId) async {
    await _firestore.collection('user').doc(userId).collection('worktimes').doc().set(workingTime.toMap());
  }
}
