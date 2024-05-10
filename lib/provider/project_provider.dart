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

  Future<void> addProject(Project project) async {
    await projectRepository.setProjectCompletion(project);
    notifyListeners();
  }

  Future<void> _loadProject() async {
    try {
      projectRepository.project.listen((projects) {
        projectLists = projects;
        projectStatus = ProjectStatus.loaded;
        notifyListeners();
      });
    } catch (e) {
      projectStatus = ProjectStatus.error;
      notifyListeners();
    }
  }
}
