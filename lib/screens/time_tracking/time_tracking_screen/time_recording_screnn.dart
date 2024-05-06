import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/data/project.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/time_tracking_screen/itemModel/stop_watch.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/time_tracking_screen/itemModel/pro_u_arbeitsplatz.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/time_tracking_screen/itemModel/workingday_list.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/working_space_screen/data/workplace.dart';

import '../../../decoration/style/decoration.dart';
import '../../../decoration/theme/theme.dart';

class TimeRecordingScreen extends StatelessWidget {
  const TimeRecordingScreen({
    super.key,
    required this.project,
    required this.workPlace,
  });
  final Project project;
  final WorkPlace workPlace;

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
              TimeRecordingItem(project: project, workPlace: workPlace),
              const SizedBox(
                height: 25,
              ),
              const StopWatch(),
              const SizedBox(
                height: 25,
              ),
              TimeList(
                project: project,
                workPlace: workPlace,
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}
