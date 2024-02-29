import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/ProjectScreen/Data/project.dart';

class ProjectRepository {
  List<Project> getProject() {
    return projectMock;
  }
}

final List<Project> projectMock = [
  Project(
    title: 'Geländerbau',
    color: const Color.fromARGB(255, 80, 73, 72),
  ),
  Project(
    title: 'Auftrag Schweißen',
    color: const Color.fromARGB(255, 80, 73, 72),
  ),
  Project(
    title: 'Brückenbau',
    color: const Color.fromARGB(255, 80, 73, 72),
  ),
  Project(
    title: 'Treppenbau',
    color: const Color.fromARGB(255, 80, 73, 72),
  ),
];
