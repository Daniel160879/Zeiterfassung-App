import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meine_zeiterfassungs_app/screens/Users/data/user.dart';
import 'package:meine_zeiterfassungs_app/screens/calendar/Data/calendar_data.dart';
import 'package:meine_zeiterfassungs_app/screens/calendar/Data/holiday_data.dart';
import 'package:meine_zeiterfassungs_app/screens/calendar/repository/calendar_repo.dart';

class FirebaseCalendarrRepository implements CalendarRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<DateTime, List<Holidays>> urlaub = {};

  @override
  Stream<List<Calendar>> get dateTime => throw UnimplementedError();

  @override
  void deleteCalendar(Calendar calendar) {}

  @override
  Future<void> setCalendarCompletion(User user, Calendar calendar) {
    throw UnimplementedError();
  }
}
