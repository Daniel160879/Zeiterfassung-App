import 'package:firebase_auth/firebase_auth.dart';
import 'package:meine_zeiterfassungs_app/src/features/screens/calendar/Data/calendar_data.dart';

abstract class CalendarRepository {
  Stream<List<Calendar>> get dateTime;
  Future<void> setCalendarCompletion(User user, Calendar calendar);
  void deleteCalendar(Calendar calendar);
}
