import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/const/theme/theme.dart';
import 'package:meine_zeiterfassungs_app/screens/Projekt%20anlegen/Data/data.dart';
import 'package:meine_zeiterfassungs_app/screens/Projekt%20anlegen/ItemModel/create_project_itme.dart';
import 'package:meine_zeiterfassungs_app/screens/Projekt%20anlegen/Repository/create_project_repository.dart';

class CreateProjectScreen extends StatelessWidget {
  CreateProjectScreen({super.key, required this.createProjectItem});

  final createProjects = CreateProjectRepository().getProject();
  final List<CreateProject> createProjectList = [];
  final List createProjectItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 80, 73, 72),
          title: const Text(
            'Projekt erstellen',
            style: myAppBarTextStyle,
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/background/background.png'), fit: BoxFit.cover),
          ),
          child: ListView(scrollDirection: Axis.vertical, children: [
            Center(
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                for (final createProject in createProjects)
                  CreateProjectItem(
                    createProject: createProject,
                  )
              ]),
            ),
          ]),
        ));
  }
}
