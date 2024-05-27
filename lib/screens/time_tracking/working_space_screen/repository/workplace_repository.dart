import 'package:meine_zeiterfassungs_app/screens/time_tracking/working_space_screen/data/workplace.dart';

abstract class WorkPlaceRepoitory {
  Stream<List<WorkPlace>> get workPlace;
  Future<void> setWorkPlaceCompletion(WorkPlace workPlace);
  void deleteWorkPlace(WorkPlace workPlace);
  void resetWorkPlace();
}
