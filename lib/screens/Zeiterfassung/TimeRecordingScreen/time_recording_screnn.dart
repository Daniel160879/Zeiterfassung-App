import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/const/theme/theme.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/ProjectScreen/Data/project.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/ProjectScreen/Repository/project_repository.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/TimeRecordingScreen/Data/project_data.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/TimeRecordingScreen/Item/clock_model.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/TimeRecordingScreen/Item/item_model.dart';

import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/WorkingSpaceScreen/Data/workplace.dart';

class TimeRecordingScreen extends StatefulWidget {
  const TimeRecordingScreen({super.key, required this.project, required this.workPlace});
  final Project project;
  final WorkPlace workPlace;

  @override
  State<TimeRecordingScreen> createState() => _TimeRecordingScrennState();
}

class _TimeRecordingScrennState extends State<TimeRecordingScreen> {
  final projectRepository = ProjectRepository().getProject();
  List<ProjectData> projectDataList = [];
  final List timeRecordingItem = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zeiterfassung', style: myAppBarTextStyle),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 80, 73, 72),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/background/background.png'), fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            children: [
              TimeRecordingItem(project: widget.project, workPlace: widget.workPlace),
              const SizedBox(
                height: 25,
              ),
              const StopWatch(),
            ],
          ),
        ),
      ),
    );
  }
}
