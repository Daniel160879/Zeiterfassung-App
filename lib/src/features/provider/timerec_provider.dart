import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/src/features/auth/data/auth_repo.dart';
import 'package:meine_zeiterfassungs_app/src/features/screens/time_tracking/projectScreen/data/project.dart';
import 'package:meine_zeiterfassungs_app/src/features/screens/time_tracking/time_tracking_screen/data/working_time.dart';
import 'package:meine_zeiterfassungs_app/src/features/screens/time_tracking/time_tracking_screen/repository/time_repository.dart';
import 'package:meine_zeiterfassungs_app/src/features/screens/time_tracking/working_space_screen/data/workplace.dart';

enum TimeRecordingStatus { loading, loaded, errror }

class TimerecordingProvider extends ChangeNotifier {
  final TimeRepository timeRepository;
  TimeRecordingStatus timeRecordingStatus = TimeRecordingStatus.loaded;
  List<WorkingTime> workingTimesList = [];
  List<WorkingTime> adminTimeList = [];
  final AuthRepository authRepository;
  Project project;
  WorkPlace workPlace;
  bool _disposed = false;
  // Diese liste enthält nicht die rohen workTimes sondern auch die Namen zu den workTimes (siehe ende der ersten for-schleife)
  List<Map<String, dynamic>> validWorkTimes = [];

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

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
    notifyListeners();
  }

  void _loadWorktime() {
    final stream = timeRepository.getWorktimesStream(authRepository.firebaseAuth.currentUser!.uid);
    stream.listen((workingTimes) {
      workingTimesList.clear();
      workingTimesList.addAll(workingTimes);
      notifyListeners();
    });
  }

  Future<void> _loadAdminTime() async {
    await timeRepository.exportWorkTimes();
    notifyListeners();
  }
}
