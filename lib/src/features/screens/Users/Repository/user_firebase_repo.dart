import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meine_zeiterfassungs_app/src/features/screens/Users/Repository/user_repository.dart';
import 'package:meine_zeiterfassungs_app/src/features/screens/Users/data/user.dart';

class FirebaseEmployerRepository implements UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<List<Users>> get userss {
    final userCollectionRef = _firestore.collection('user');
    final employerSnapshot = userCollectionRef.snapshots();
    final employerStream = employerSnapshot.map((snapshot) =>
        snapshot.docs.map((e) => Users.fromFirestore(e)).toList());
    return employerStream;
  }

  @override
  Future<Users> loadUser(String id) async {
    final idCollectionRef = _firestore.collection('user').doc(id);
    final snapshot = await idCollectionRef.get();
    return Users.fromFirestore(snapshot);
  }

  @override
  void deletUser(Users user) {
    final userCollectionRef = _firestore.collection('user');
    userCollectionRef.doc().delete();
  }

  @override
  Future<void> setUserCompletion(Users user) async {
    final userCallectionRef = _firestore.collection('user');
    final docRef = userCallectionRef.doc();
    await docRef.set(user.toMap());
  }

  @override
  // TODO: implement users
  Stream<List<Users>> get users => throw UnimplementedError();
}
