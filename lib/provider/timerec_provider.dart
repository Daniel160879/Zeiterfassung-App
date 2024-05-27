import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/time_tracking_screen/data/working_time.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/time_tracking_screen/repository/time_repository.dart';

enum TimeRecordingStatus { loading, loaded, errror }

class TimerecordingProvider extends ChangeNotifier {
  final TimeRepoitory timeRepository;
  TimeRecordingStatus timeRecordingStatus = TimeRecordingStatus.loaded;
  List<WorkingTime> workingTimesList = [];

  TimerecordingProvider(this.timeRepository) {
    _loadTime();
  }
  Future<void> addWorkingTime(WorkingTime workingTime) async {
    await timeRepository.setWorkTimeComplition(workingTime);
    notifyListeners();
  }

  Future<void> _loadTime() async {
    throw Exception();
    // notifyListeners();
  }
}
