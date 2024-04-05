import '../data/working_time.dart';

class WorkingTimeRepository {
  List<WorkingTime> getWorkingTime() {
    return workingTimeMock;
  }

  List<WorkingTime> workingTimeMock = [
    WorkingTime(
        hours: Duration.hoursPerDay,
        minutes: Duration.minutesPerDay,
        seconds: Duration.secondsPerDay,
        workingDay: DateTime.monday as String)
  ];
}
