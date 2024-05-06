import '../data/working_time.dart';

class TimeRepository {
  List<WorkingTime> getWorkingTime() {
    return workingTimeMock;
  }

  List<WorkingTime> workingTimeMock = [
    WorkingTime(
      hours: Duration.hoursPerDay,
      minutes: Duration.minutesPerDay,
      seconds: Duration.secondsPerDay,
    )
  ];
}
