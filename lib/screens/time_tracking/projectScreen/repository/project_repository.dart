import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/Data/project.dart';

class ProjectRepository {
  final List<Project> projectMock = [];

  Future<List<Project>> getProject() async {
    return await Future.value(projectMock);
  }

  void addProject(Project project) {
    projectMock.add(project);
  }
}
