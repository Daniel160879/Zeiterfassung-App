import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/data/project.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/working_space_screen/workingspace_screen.dart';
import '../../../../decoration/theme/theme.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem({super.key, required this.project});

  final Project project;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            alignment: Alignment.center,
            height: 65,
            width: 220,
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
                            )));
              },
              child: Text(
                project.title,
                style: myProjectTextStyle,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          )
        ]));
  }
}
