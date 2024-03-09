import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/const/theme/theme.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/ProjectScreen/Data/project.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/TimeRecordingScreen/time_recording_screnn.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/WorkingSpaceScreen/Data/workplace.dart';

class WorkPlaceItem extends StatelessWidget {
  const WorkPlaceItem({
    super.key,
    required this.project,
    required this.workPlace,
  });
  final Project project;
  final WorkPlace workPlace;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TimeRecordingScreen(
                    project: project,
                    workPlace: workPlace,
                  ),
                ));
          },
          child: Container(
            alignment: Alignment.center,
            height: 80,
            width: 175,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: const Color.fromARGB(255, 80, 73, 72),
            ),
            child: Text(
              workPlace.title,
              style: myBttnTextStyle,
            ),
          ),
        )
      ],
    );
  }
}
