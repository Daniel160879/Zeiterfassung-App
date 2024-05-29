import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/time_tracking_screen/data/working_time.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/time_tracking_screen/repository/time_repository.dart';

class FirebaseTimeRepository implements TimeRepoitory {
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
  Future<void> setWorkTimeComplition(WorkingTime workingTime) async {
    final workTimesCollectionRef = _firestore.collection('worktimes');
    final docRef = workTimesCollectionRef.doc();
    await docRef.set(workingTime.toMap());
  }
}
