import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meine_zeiterfassungs_app/src/features/screens/time_tracking/time_tracking_screen/data/working_time.dart';
import 'package:meine_zeiterfassungs_app/src/features/screens/time_tracking/time_tracking_screen/repository/time_repository.dart';

class FirebaseTimeRepository implements TimeRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // Diese liste enthält nicht die rohen workTimes sondern auch die Namen zu den workTimes (siehe ende der ersten for-schleife)
  List<Map<String, dynamic>> validWorkTimes = [];

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

  @override
  Future<void> exportWorkTimes() async {
    QuerySnapshot usersSnapshot = await _firestore.collection('user').get();
    List<DocumentReference> users = usersSnapshot.docs.map((doc) => doc.reference).toList();
    //Resultierende Liste an Maps mit FirstName,LastName und validWorkTimes (Für den spezifizierten Zeitraum)

    for (DocumentReference user in users) {
      Map<String, dynamic> userData = await user.get().then((doc) => doc.data() as Map<String, dynamic>);
      //Daten des Users
      String firstName = userData["firstName"];
      String lastName = userData["lastName"];
      QuerySnapshot workTimesSnapshot = await user.collection("workTimes").get();
      List<Map<String, dynamic>> workTimes =
          workTimesSnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
      //Zwischenscpeichern der worktimes für EINEN user. (gefiltern)
      List<Map<String, dynamic>> rawWorkTimes = [];
      for (Map<String, dynamic> workTime in workTimes) {
        rawWorkTimes.add(workTime);
      }
      //Erstelle Worktime um sie zu Speichern
      if (rawWorkTimes.isNotEmpty) {
        Map<String, dynamic> workTime = {};
        workTime["firstName"] = firstName;
        workTime["lastName"] = lastName;
        workTime["validWorkTimes"] = rawWorkTimes;
        validWorkTimes.add(workTime);
      }
    }
    //TODO Valid work times zu CSV
    //TODO CSV auf datenträger speichern
  }
}
