import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/data/project.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/repository/project_repository.dart';

class ProjectProvider with ChangeNotifier {
  final ProjectRepository projectRepository;
  List<Project> projectList = [];

  ProjectProvider(this.projectRepository) {
    _loadProject();
  }

  void addProject(Project project) {
    projectList.add(project);
    projectRepository.saveProjects(projectList);
    notifyListeners();
  }

  void _loadProject() {
    projectList = projectRepository.getProject();
    projectRepository.loadProjects();
    notifyListeners();
  }

  void removeProject(Project project) {
    projectList.remove(project);
    notifyListeners();
  }

  void removeAt(int index) {
    projectList.removeAt(index);
    notifyListeners();
  }
}
