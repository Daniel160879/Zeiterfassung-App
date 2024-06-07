import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/data/project.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/working_space_screen/data/workplace.dart';

import '../../../../decoration/theme/theme.dart';

class TimeRecordingItem extends StatelessWidget {
  const TimeRecordingItem({super.key, required this.project, required this.workPlace});

  final Project project;
  final WorkPlace workPlace;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Container(
          height: 80,
          width: 250,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 80, 73, 72),
            borderRadius: BorderRadius.circular(22),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Projekt :',
                style: myAppBarTextStyle,
              ),
              Text(
                project.title,
                style: myTextStyle,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          height: 100,
          width: 300,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 80, 73, 72),
            borderRadius: BorderRadius.circular(22),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Arbeitsplatz :',
                style: myAppBarTextStyle,
              ),
              Text(
                workPlace.title,
                style: myTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
