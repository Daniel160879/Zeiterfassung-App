import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/data/project.dart';

import 'package:meine_zeiterfassungs_app/screens/time_tracking/working_space_screen/data/workplace.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/working_space_screen/repository/workplace_repository.dart';

enum WorkplaceStatus { loaded, loading, error }

class WorkingPlaceProvider extends ChangeNotifier {
  final WorkPlaceRepoitory workPlaceRepoitory;
  WorkplaceStatus workplaceStatus = WorkplaceStatus.loaded;
  List<WorkPlace> workPlacesList = [];

  WorkingPlaceProvider(this.workPlaceRepoitory) {
    _loadWorkPlace();
  }

  Future<void> addWorkPlace(WorkPlace workPlace) async {
    await workPlaceRepoitory.setWorkPlaceCompletion(workPlace);
    notifyListeners();
  }

  Future<void> addWorkPlaceToUser(WorkPlace workPlace, String userId, Project project) async {
    await workPlaceRepoitory.setWorkplaceCompletionToUser(workPlace, userId, project);
    notifyListeners();
  }

  Future<void> _loadWorkPlace() async {
    try {
      workPlaceRepoitory.workPlace.listen((workPlaces) {
        workPlacesList = workPlaces;
        workplaceStatus = WorkplaceStatus.loaded;
        notifyListeners();
      });
    } catch (e) {
      workplaceStatus = WorkplaceStatus.error;
      notifyListeners();
    }
  }
}
