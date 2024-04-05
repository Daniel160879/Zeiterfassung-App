import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/Data/project.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/Repository/project_repository.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/time_tracking_screen/itemModel/stop_watch.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/time_tracking_screen/itemModel/pro_u_arbeitsplatz.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/time_tracking_screen/itemModel/workingday_list.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/working_space_screen/Data/workplace.dart';

import '../../../constants/style/decoration.dart';
import '../../../constants/theme/theme.dart';

class TimeRecordingScreen extends StatefulWidget {
  const TimeRecordingScreen({
    super.key,
    required this.project,
    required this.workPlace,
  });
  final Project project;
  final WorkPlace workPlace;

  @override
  State<TimeRecordingScreen> createState() => _TimeRecordingScrennState();
}

class _TimeRecordingScrennState extends State<TimeRecordingScreen> {
  final projectRepository = ProjectRepository().getProject();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zeiterfassung', style: myAppBarTextStyle),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 80, 73, 72),
      ),
      body: Container(
        decoration: myBoxdeco,
        child: Center(
          child: ListView(children: [
            Column(children: [
              const SizedBox(
                height: 25,
              ),
              TimeRecordingItem(project: widget.project, workPlace: widget.workPlace),
              const SizedBox(
                height: 25,
              ),
              const StopWatch(),
              const SizedBox(
                height: 25,
              ),
              const TimeList(),
            ]),
          ]),
        ),
      ),
    );
  }
}
