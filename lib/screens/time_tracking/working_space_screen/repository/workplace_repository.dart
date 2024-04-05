import 'package:meine_zeiterfassungs_app/screens/time_tracking/working_space_screen/Data/workplace.dart';

class WorkPlaceRepoitory {
  List<WorkPlace> workPlaceMock = [];

  Future<List<WorkPlace>> getWorkPlace() {
    return Future.value(workPlaceMock);
  }

  void addWorkplace(WorkPlace workPlace) {
    workPlaceMock.add(workPlace);
  }
}
