import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/ProjectScreen/Data/project.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/ProjectScreen/Item/project_item.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/ProjectScreen/Repository/project_repository.dart';

class ChooseProjectScreen extends StatefulWidget {
  const ChooseProjectScreen({super.key});

  @override
  State<ChooseProjectScreen> createState() => _ChooseProjectScreenState();
}

class _ChooseProjectScreenState extends State<ChooseProjectScreen> {
  final projects = ProjectRepository().getProject();

  final List<Project> projectList = [];

  final List projectItem = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 80, 73, 72),
          title: const Text('Project Screen')),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/background/background.png',
              ),
              fit: BoxFit.fill),
        ),
        child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          for (final project in projects)
            ProjectItem(
              project: project,
            )
        ])),
      ),
    );
  }
}
