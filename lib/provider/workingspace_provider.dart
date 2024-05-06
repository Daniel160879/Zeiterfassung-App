import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/working_space_screen/data/workplace.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/working_space_screen/repository/workplace_repository.dart';

class WorkingPlaceProvider with ChangeNotifier {
  final WorkPlaceRepoitory workPlaceRepoitory;
  List<WorkPlace> workPlaceList = [];

  WorkingPlaceProvider(this.workPlaceRepoitory) {
    _loadWorkPlace;
  }

  void addWorkPlace(WorkPlace workPlace) {
    workPlaceList.add(workPlace);
    notifyListeners();
  }

  void _loadWorkPlace() {
    workPlaceRepoitory.getWorkPlace();
    notifyListeners();
  }

  void removeWorkPlace(WorkPlace workPlace) {
    workPlaceList.remove(workPlace);
    notifyListeners();
  }

  void removeAt(int index) {
    workPlaceList.removeAt(index);
    notifyListeners();
  }
}
