import 'dart:convert';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/working_space_screen/data/workplace.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WorkPlaceRepoitory {
  Future<List<WorkPlace>> loadWorkplace() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String workPlaceString = prefs.getString('workplaces') ?? 'no data';
    if (workPlaceString.isEmpty) {
      return Future.value([]);
    }
    return Future.value(fromJson(workPlaceString));
  }

  Future<void> saveWorkplaces(List<WorkPlace> workPlaces) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('workplaces', jsonEncode(toJson(workPlaces)));
  }

  Future<void> deleteWorkplace(workplace) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('workplaces');
  }

  // fromJson
  List<WorkPlace> fromJson(String json) {
    final List<WorkPlace> workPlaces = [];
    final Map<String, dynamic> workPlacesMap = jsonDecode(json);
    final List<dynamic> workPlacesList = workPlacesMap['workplaces'];
    for (Map<String, dynamic> workPlaceMap in workPlacesList) {
      final WorkPlace workPlace = WorkPlace.fromJson(workPlaceMap);
      workPlaces.add(workPlace);
    }
    return workPlaces;
  }

  // toJson
  Map<String, dynamic> toJson(List<WorkPlace> workPlaces) {
    List<Map<String, dynamic>> workPlaceJsons = [];
    for (WorkPlace workPlace in workPlaces) {
      workPlaceJsons.add(workPlace.toJson());
    }
    Map<String, dynamic> workPlaceMap = {'workplaces': workPlaceJsons};
    return workPlaceMap;
  }
}
