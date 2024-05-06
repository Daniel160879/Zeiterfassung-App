import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/decoration/theme/theme.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/data/project.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/time_tracking_screen/time_recording_screnn.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/working_space_screen/data/workplace.dart';

class WorkplaceItem extends StatelessWidget {
  const WorkplaceItem({super.key, required this.project, required this.workplace});

  final WorkPlace workplace;
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
                        builder: (context) => TimeRecordingScreen(
                              workPlace: workplace,
                              project: project,
                            )));
              },
              child: Text(
                workplace.title,
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
