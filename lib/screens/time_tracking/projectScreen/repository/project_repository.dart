import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/data/project.dart';

abstract class ProjectRepository {
  Stream<List<Project>> get project;
  Future<void> setProjectCompletionToUser(Project project, String userId);
  Future<void> setProjectCompletion(Project project);
  void deletProject(Project project);
  void resetProject();
}
