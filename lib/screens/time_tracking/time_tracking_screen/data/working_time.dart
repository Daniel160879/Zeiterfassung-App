import 'package:cloud_firestore/cloud_firestore.dart';

class WorkingTime {
  String workingTimeId;
  DateTime workday;
  String projectTitle;
  String workplaceTitle;
  int seconds;
  int minutes;
  int hours;

  WorkingTime({
    required this.workingTimeId,
    required this.workday,
    required this.projectTitle,
    required this.workplaceTitle,
    required this.hours,
    required this.minutes,
    required this.seconds,
  });
  @override
  String toString() {
    return '$hours : $minutes : $seconds';
  }

  factory WorkingTime.fromFirestore(DocumentSnapshot doc) {
    if (!doc.exists) throw ArgumentError('mist schief gelaufen');

    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return WorkingTime(
      workingTimeId: doc.id,
      workday: (data['workday'] as Timestamp).toDate(),
      projectTitle: data['projectTitle'] as String,
      workplaceTitle: data['workplaceTitle'] as String,
      hours: data['hours'] as int,
      minutes: data['minutes'] as int,
      seconds: data['seconds'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'workday': workday,
      'projectTitle': projectTitle,
      'workplaceTitle': workplaceTitle,
      'hours': hours,
      'minutes': minutes,
      'seconds': seconds,
    };
  }
}
