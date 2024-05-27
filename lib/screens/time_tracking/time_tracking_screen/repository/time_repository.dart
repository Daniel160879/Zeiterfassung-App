import 'package:meine_zeiterfassungs_app/screens/time_tracking/time_tracking_screen/data/working_time.dart';

abstract class TimeRepoitory {
  Stream<List<WorkingTime>> get workTimes;
  Future<void> setWorkTimeComplition(WorkingTime workingTime);
  void deleteWorkPlace(WorkingTime workingTime);
  void resetWorkPlace();
}
