import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/data/project.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/time_tracking_screen/data/working_time.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/working_space_screen/data/workplace.dart';

abstract class TimeRepository {
  Stream<List<WorkingTime>> get workTimes;
  Future<void> setWorkTimeComplitionToUser(
      WorkingTime workingTime, Project project, String userId, WorkPlace workPlace);
  void deleteWorkPlace(WorkingTime workingTime);
}
