import 'package:meine_zeiterfassungs_app/screens/time_tracking/time_tracking_screen/data/working_time.dart';

abstract class TimeRepository {
  Stream<List<WorkingTime>> getWorktimesStream(
    String userId,
  );
  Future<void> setWorkTimeComplitionToUser(
    WorkingTime workingTime,
    String userId,
  );
  void deleteWorkTime(String workingtimeId, String userId);
}
