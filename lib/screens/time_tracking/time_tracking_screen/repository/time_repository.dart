import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/working_time.dart';

class TimeRepository {
  List<WorkingTime> getWorkingTime() {
    return workingTimeList;
  }

  List<WorkingTime> workingTimeList = [
    WorkingTime(
      hours: Duration.hoursPerDay,
      minutes: Duration.minutesPerDay,
      seconds: Duration.secondsPerDay,
    )
  ];

  Future<List<WorkingTime>> loadWorkingTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String finalString = prefs.getString('workingtimes') ?? 'no data';
    if (finalString.isEmpty) {
      return Future.value([]);
    }
    return Future.value(fromJson(finalString));
  }

  Future<void> saveWorkingTime(List<WorkingTime> workingTimes) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('workingtimes', jsonEncode(toJson(workingTimes)));
  }

  Future<void> deleteWorkingTime(WorkingTime) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('workingtimes');
  }

  // FROMJSON LIST
  List<WorkingTime> fromJson(String json) {
    final List<WorkingTime> workingTimes = [];
    final Map<String, dynamic> workingMap = jsonDecode(json);
    final List<dynamic> workingTimesList = workingMap['workingtimes'];
    for (Map<String, dynamic> workingMap in workingTimesList) {
      final WorkingTime workingTime = WorkingTime.fromJson(workingMap);
      workingTimes.add(workingTime);
    }
    return workingTimes;
  }

  //TOJSON LIST
  Map<String, dynamic> toJson(List<WorkingTime> workingTimes) {
    List<Map<String, dynamic>> workingTimesJson = [];
    for (WorkingTime workingTime in workingTimes) {
      workingTimesJson.add(workingTime.toJson());
    }
    Map<String, dynamic> workingTimesMap = {'workingtimes': workingTimesJson};
    return workingTimesMap;
  }
}
