import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/working_space_screen/data/workplace.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/working_space_screen/repository/workplace_repository.dart';

class FirebaseWorkPlaceRepository implements WorkPlaceRepoitory {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<List<WorkPlace>> get workPlace {
    final workplaceCollectionRef = _firestore.collection('workplaces');
    final workplaceSnapshot = workplaceCollectionRef.snapshots();
    final workplaceStream =
        workplaceSnapshot.map((snapshot) => snapshot.docs.map((e) => WorkPlace.fromFirestore(e)).toList());
    return workplaceStream;
  }

  @override
  Future<void> deleteWorkPlace(WorkPlace workPlace) async {
    await FirebaseFirestore.instance
        .collection('workplaces')
        .where('title', isEqualTo: workPlace.title)
        .get()
        .then((snapshot) => snapshot.docs.forEach((doc) {
              doc.reference.delete();
            }));
  }

  @override
  void resetWorkPlace() {
    final workplaceCollectionRef = _firestore.collection('workplaces');
    workplaceCollectionRef.get().then((snapshot) {
      for (final doc in snapshot.docs) {
        doc.reference.delete();
      }
    });
  }

  @override
  Future<void> setWorkPlaceCompletion(WorkPlace workPlace) async {
    final workplaceCollectionRef = _firestore.collection('workplaces');
    final docRef = workplaceCollectionRef.doc();
    await docRef.set(workPlace.toMap());
    workPlace.id = docRef.id;
  }
}
