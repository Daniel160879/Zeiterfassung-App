import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/data/project.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/repository/project_repository.dart';

enum ProjectStatus { loading, loaded, error }

class ProjectProvider extends ChangeNotifier {
  final ProjectRepository projectRepository;
  ProjectStatus projectStatus = ProjectStatus.loading;
  List<Project> projectLists = [];

  ProjectProvider(this.projectRepository) {
    _loadProject();
  }

  void addProject(Project project) {
    projectLists.add(project);
    projectRepository.setProjectCompletion(project);
    notifyListeners();
  }

  Future<void> _loadProject() async {
    try {
      projectRepository.project.listen((project) {
        project.clear();
        project.addAll(project);
        projectStatus = ProjectStatus.loaded;
      });
      notifyListeners();
    } catch (e) {
      projectStatus = ProjectStatus.error;
      notifyListeners();
    }
  }

  void removeProject(Project project) {
    projectLists.remove(project);
    projectRepository.deletProject(project);
    notifyListeners();
  }

  void removeAt(int index) {
    projectLists.removeAt(index);
    notifyListeners();
  }
}
