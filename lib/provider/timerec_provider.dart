import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/time_tracking_screen/data/working_time.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/time_tracking_screen/repository/time_repository.dart';

class TimerecordingProvider extends ChangeNotifier {
  final TimeRepository timeRepository;
  List<WorkingTime> workingTimeList = [];

  TimerecordingProvider(this.timeRepository) {
    _loadTime;
  }

  void addWorkingTime(WorkingTime workingTime) {
    workingTimeList.add(workingTime);
    notifyListeners();
  }

  void _loadTime() {
    timeRepository.getWorkingTime();
    notifyListeners();
  }

  void removeWorkingTime(WorkingTime workingTime) {
    workingTimeList.remove(workingTime);
    notifyListeners();
  }

  void removeAt(int index) {
    workingTimeList.removeAt(index);
    notifyListeners();
  }
}
