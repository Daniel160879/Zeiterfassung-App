import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/const/theme/theme.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/ProjectScreen/Data/project.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/WorkingSpaceScreen/Data/workplace.dart';

class TimeRecordingItem extends StatefulWidget {
  const TimeRecordingItem({super.key, required this.project, required this.workPlace});

  final Project project;
  final WorkPlace workPlace;

  @override
  State<TimeRecordingItem> createState() => _TimeRecordingItemState();
}

class _TimeRecordingItemState extends State<TimeRecordingItem> {
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
                'Project :',
                style: myTextStyle,
              ),
              Text(
                widget.project.title,
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
                widget.workPlace.title,
                style: myTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
