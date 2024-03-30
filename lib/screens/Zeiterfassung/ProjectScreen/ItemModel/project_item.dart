import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/Konstanten/theme/theme.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/ProjectScreen/Data/project.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/WorkingSpaceScreen/Repository/workplace_repository.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/WorkingSpaceScreen/workingspace_screen.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    WorkPlaceRepoitory workPlaceRepoitory = WorkPlaceRepoitory();
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 75,
            width: 175,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: const Color.fromARGB(255, 80, 73, 72),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChooseWorkingSpace(
                              project: project,
                              workPlaceRepoitory: workPlaceRepoitory,
                            )));
              },
              child: Text(
                project.title,
                style: myBttnTextStyle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
