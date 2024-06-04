import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/data/project.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/working_space_screen/data/workplace.dart';

abstract class WorkPlaceRepoitory {
  Stream<List<WorkPlace>> get workPlace;
  Future<void> setWorkPlaceCompletion(
    WorkPlace workPlace,
  );
  Future<void> setWorkplaceCompletionToUser(WorkPlace workplace, String userId, Project project);
  void deleteWorkPlace(WorkPlace workPlace);
  void resetWorkPlace();
}
