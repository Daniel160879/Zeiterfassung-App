import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meine_zeiterfassungs_app/screens/employers/Repository/employers_repository.dart';
import 'package:meine_zeiterfassungs_app/screens/employers/data/employers.dart';

class FirebaseEmployerRepository implements EmployersRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<List<Employer>> get employers {
    final employerCollectionRef = _firestore.collection('employer');
    final employerSnapshot = employerCollectionRef.snapshots();
    final employerStream =
        employerSnapshot.map((snapshot) => snapshot.docs.map((e) => Employer.fromFirestore(e)).toList());
    return employerStream;
  }

  @override
  void resetEmployer() {
    final employerCollectionRef = _firestore.collection('employer');
    employerCollectionRef.get().then((snapshot) {
      for (final doc in snapshot.docs) {
        doc.reference.delete();
      }
    });
  }

  @override
  void deletEmployer(Employer employer) {
    final employerCollectionRef = _firestore.collection('employer');
    employerCollectionRef.doc().delete();
  }

  @override
  Future<void> setEmployerCompletion(Employer employer) async {
    final employerCallectionRef = _firestore.collection('employer');
    final docRef = employerCallectionRef.doc();
    await docRef.set(employer.toMap());
  }
}
