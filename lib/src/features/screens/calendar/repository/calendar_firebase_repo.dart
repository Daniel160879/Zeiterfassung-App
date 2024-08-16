import 'package:firebase_auth/firebase_auth.dart';
import 'package:meine_zeiterfassungs_app/src/features/screens/calendar/Data/calendar_data.dart';
import 'package:meine_zeiterfassungs_app/src/features/screens/calendar/Data/holiday_data.dart';
import 'package:meine_zeiterfassungs_app/src/features/screens/calendar/repository/calendar_repo.dart';

class FirebaseCalendarrRepository implements CalendarRepository {
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
