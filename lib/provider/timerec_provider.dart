import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/screens/auth/repository/auth_repo.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/data/project.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/time_tracking_screen/data/working_time.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/time_tracking_screen/repository/time_repository.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/working_space_screen/data/workplace.dart';

enum TimeRecordingStatus { loading, loaded, errror }

class TimerecordingProvider extends ChangeNotifier {
  final TimeRepository timeRepository;
  TimeRecordingStatus timeRecordingStatus = TimeRecordingStatus.loaded;
  List<WorkingTime> workingTimesList = [];
  final AuthRepository authRepository;

  Project project;

  WorkPlace workPlace;

  TimerecordingProvider(this.timeRepository, this.authRepository, this.project, this.workPlace) {
    _loadWorktime();
  }

  Future<void> addWorkingTimeToUser(
    WorkingTime workingTime,
    String userId,
  ) async {
    await timeRepository.setWorkTimeComplitionToUser(
      workingTime,
      userId,
    );
    workingTimesList.add(workingTime);

    notifyListeners();
  }

  void _loadWorktime() async {
    final stream = timeRepository.getWorktimesStream(
      authRepository.firebaseAuth.currentUser!.uid,
    );
    stream.listen((workingTimes) {
      workingTimesList.clear();
      workingTimesList.addAll(workingTimes);
      notifyListeners();
    });
  }
}
