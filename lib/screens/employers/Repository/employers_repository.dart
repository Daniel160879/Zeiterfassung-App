import 'dart:convert';
import 'package:meine_zeiterfassungs_app/screens/employers/data/employers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmployersRepository {
  Future<List<Employer>> loadEmployers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String employersString = prefs.getString('employers') ?? 'no Data';
    if (employersString.isEmpty) {
      return Future.value([]);
    }
    return Future.value(fromJson(employersString));
  }

  Future<void> saveEmployers(List<Employer> employer) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('employers', jsonEncode(toJson(employer)));
  }

  Future<void> deleteEmployers(List<Employer> employer) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('employers');
  }

  // FROMJSON LIST
  List<Employer> fromJson(String json) {
    final List<Employer> employers = [];
    final Map<String, dynamic> employersMap = jsonDecode(json);
    final List<dynamic> employersList = employersMap['employers'];
    for (Map<String, dynamic> employersMap in employersList) {
      final Employer employer = Employer.fromJson(employersMap);
      employers.add(employer);
    }
    return employers;
  }

// TOJSON LIST
  Map<String, dynamic> toJson(List<Employer> employers) {
    List<Map<String, dynamic>> employersJson = [];
    for (Employer employer in employers) {
      employersJson.add(employer.toJson());
    }
    Map<String, dynamic> employersMap = {'employers': employersJson};
    return employersMap;
  }
}
