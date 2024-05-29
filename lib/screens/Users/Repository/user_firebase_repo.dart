import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meine_zeiterfassungs_app/screens/Users/Repository/user_repository.dart';
import 'package:meine_zeiterfassungs_app/screens/Users/data/user.dart';

class FirebaseEmployerRepository implements UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<List<User>> get users {
    final userCollectionRef = _firestore.collection('employer');
    final employerSnapshot = userCollectionRef.snapshots();
    final employerStream = employerSnapshot.map((snapshot) => snapshot.docs.map((e) => User.fromFirestore(e)).toList());
    return employerStream;
  }

  @override
  void resetEmployer() {
    final userCollectionRef = _firestore.collection('employer');
    userCollectionRef.get().then((snapshot) {
      for (final doc in snapshot.docs) {
        doc.reference.delete();
      }
    });
  }

  @override
  void deletEmployer(User user) {
    final userCollectionRef = _firestore.collection('employer');
    userCollectionRef.doc().delete();
  }

  @override
  Future<void> setEmployerCompletion(User user) async {
    final userCallectionRef = _firestore.collection('employer');
    final docRef = userCallectionRef.doc();
    await docRef.set(user.toMap());
  }
}
