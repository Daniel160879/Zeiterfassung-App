import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/time_tracking_screen/data/working_time.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/time_tracking_screen/repository/time_repository.dart';

class TimerecordingProvider extends ChangeNotifier {
  final TimeRepository timeRepository;
  List<WorkingTime> workingTimesList = [];

  TimerecordingProvider(this.timeRepository) {
    _loadTime();
  }

  void addWorkingTime(WorkingTime workingTime) {
    workingTimesList.add(workingTime);
    timeRepository.saveWorkingTime(workingTimesList);
    notifyListeners();
  }

  Future<void> _loadTime() async {
    workingTimesList = await timeRepository.loadWorkingTime();
    notifyListeners();
  }

  void removeWorkingTime(WorkingTime workingTime) {
    workingTimesList.remove(workingTime);
    timeRepository.deleteWorkingTime(timeRepository.workingTimeList);
    notifyListeners();
  }

  void removeAt(int index) {
    workingTimesList.removeAt(index);
    notifyListeners();
  }
}
