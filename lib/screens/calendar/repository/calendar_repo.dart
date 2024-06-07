import 'package:meine_zeiterfassungs_app/screens/Users/data/user.dart';
import 'package:meine_zeiterfassungs_app/screens/calendar/Data/calendar_data.dart';

abstract class CalendarRepository {
  Stream<List<Calendar>> get dateTime;
  Future<void> setCalendarCompletion(User user, Calendar calendar);
  void deleteCalendar(Calendar calendar);
}
