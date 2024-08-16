import 'package:cloud_firestore/cloud_firestore.dart';

class Holidays {
  String holidaysId;
  String day;

  Holidays({required this.holidaysId, required this.day});

  factory Holidays.fromFirestore(DocumentSnapshot doc) {
    if (!doc.exists) throw ArgumentError('mist schifgelaufen');

    final Map<String, DateTime> data = doc.data() as Map<String, DateTime>;
    return Holidays(holidaysId: doc.id, day: data['day'] as String);
  }
}
