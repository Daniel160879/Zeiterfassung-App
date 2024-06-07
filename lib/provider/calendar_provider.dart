import 'package:flutter/foundation.dart';
import 'package:meine_zeiterfassungs_app/screens/calendar/Data/holiday_data.dart';
import 'package:meine_zeiterfassungs_app/screens/calendar/repository/calendar_repo.dart';

class CalendarProvider extends ChangeNotifier {
  final CalendarRepository calendarRepository;
  List<Holidays> holidaysList = [];

  CalendarProvider(this.calendarRepository);
}
