import 'package:meine_zeiterfassungs_app/src/features/screens/time_tracking/time_tracking_screen/data/working_time.dart';

abstract class TimeRepository {
  Stream<List<WorkingTime>> getWorktimesStream(
    String userId,
  );
  Future<void> setWorkTimeComplitionToUser(
    WorkingTime workingTime,
    String userId,
  );
  void deleteWorkTime(WorkingTime workingTime, String userId);

  Future<void> exportWorkTimes();
}
