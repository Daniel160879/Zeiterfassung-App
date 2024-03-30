import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/WorkingSpaceScreen/Data/workplace.dart';

class WorkPlaceRepoitory {
  List<WorkPlace> workPlaceMock = [];

  Future<List<WorkPlace>> getWorkPlace() {
    return Future.value(workPlaceMock);
  }

  void addWorkplace(WorkPlace workPlace) {
    workPlaceMock.add(workPlace);
  }
}
