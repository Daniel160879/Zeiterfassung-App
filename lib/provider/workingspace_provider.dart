import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/working_space_screen/data/workplace.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/working_space_screen/repository/workplace_repository.dart';

class WorkingPlaceProvider with ChangeNotifier {
  final WorkPlaceRepoitory workPlaceRepoitory;
  List<WorkPlace> workPlacesList = [];

  WorkingPlaceProvider(this.workPlaceRepoitory) {
    _loadWorkPlace();
  }

  void addWorkPlace(WorkPlace workPlace) {
    workPlacesList.add(workPlace);
    workPlaceRepoitory.saveWorkplaces(workPlacesList);
    notifyListeners();
  }

  Future<void> _loadWorkPlace() async {
    workPlacesList = await workPlaceRepoitory.loadWorkplace();
    notifyListeners();
  }

  void removeWorkPlace(WorkPlace workPlace) {
    workPlacesList.remove(workPlace);
    workPlaceRepoitory.deleteWorkplace(workPlace);
    notifyListeners();
  }

  void removeAt(int index) {
    workPlacesList.removeAt(index);
    notifyListeners();
  }
}
