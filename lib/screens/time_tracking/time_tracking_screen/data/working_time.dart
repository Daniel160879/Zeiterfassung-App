import 'package:cloud_firestore/cloud_firestore.dart';

class WorkingTime {
  int seconds;
  int minutes;
  int hours;

  WorkingTime({
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
      hours: data['hours'] as int,
      minutes: data['minutes'] as int,
      seconds: data['seconds'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'hours': hours,
      'minutes': minutes,
      'seconds': seconds,
    };
  }
}
