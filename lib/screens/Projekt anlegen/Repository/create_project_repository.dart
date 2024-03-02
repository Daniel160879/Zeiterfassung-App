import 'package:meine_zeiterfassungs_app/screens/Projekt%20anlegen/Data/data.dart';

class CreateProjectRepository {
  List<CreateProject> getProject() {
    return createProjectMock;
  }
}

final List<CreateProject> createProjectMock = [
  CreateProject(title: 'qweqw', discription: 'werwerwe', projectTime: '3,00'),
  CreateProject(title: 'qweqw', discription: 'werwerwe', projectTime: '3,00'),
];
