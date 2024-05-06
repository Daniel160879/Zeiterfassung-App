import 'dart:convert';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/data/project.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProjectRepository {
  final List<Project> projects = []; // liste weg weil in shared

  List<Project> getProject() {
    return projects; // weg
  }

  ProjectRepository() {
    // auch weg
    loadProjects().then(
      (value) {
        value = projects;
        return projects;
      },
    );
  }

  void addProject(Project project) {
    projects.add(project);
  }

// SP { title: 'Hochhaus' } jetzt aber { title: { 'title': "Hochhaus" } }
  Future<List<Project>> loadProjects() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String projectsString = prefs.getString('projects') ?? '';
    if (projectsString.isEmpty) {
      return Future.value([]);
    }
    return Future.value(fromJson(projectsString));
  }

  Future<void> saveProjects(List<Project> projects) async {
    SharedPreferences prefs = await SharedPreferences.getInstance(); // liste setzen
    await prefs.setString('projects', jsonEncode(toJson(projects)));
  }

  //fromJson
  List<Project> fromJson(String json) {
    final List<Project> projects = [];
    final Map<String, dynamic> projectsMap = jsonDecode(json);
    final List<dynamic> projectsList = projectsMap['projects'];
    for (Map<String, dynamic> projectMap in projectsList) {
      final Project project = Project.fromJson(projectMap);
      projects.add(project);
    }
    return projects;
  }

  //toJson
  Map<String, dynamic> toJson(List<Project> projects) {
    //{projects:[{'title': "Hochhaus" },{'title': "Bad" },{'title': "Baustelle" }]}
    List<Map<String, dynamic>> projectJsons = [];
    for (Project project in projects) {
      projectJsons.add(project.toJson());
    }
    Map<String, dynamic> projectsMap = {'projects': projectJsons};
    return projectsMap;
  }
}

// Speichern Dart Object -> Json Object -> Speichern in SP
// Laden Laden als String -> FromJson zu Dart OBject -> Object Variable returnen
