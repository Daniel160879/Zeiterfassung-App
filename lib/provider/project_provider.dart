import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/data/project.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/repository/project_repository.dart';

class ProjectProvider extends ChangeNotifier {
  final ProjectRepository projectRepository;
  List<Project> projectLists = [];

  ProjectProvider(this.projectRepository) {
    _loadProject();
  }

  void addProject(Project project) {
    projectLists.add(project);
    projectRepository.saveProjects(projectLists);
    notifyListeners();
  }

  Future<void> _loadProject() async {
    projectLists = await projectRepository.loadProjects();
    notifyListeners();
  }

  void removeProject(Project project) {
    projectLists.remove(project);
    projectRepository.deleteProjects(projectLists);
    notifyListeners();
  }

  void removeAt(int index) {
    projectLists.removeAt(index);
    notifyListeners();
  }
}
