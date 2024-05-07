import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/provider/timerec_provider.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/data/project.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/working_space_screen/data/workplace.dart';
import 'package:provider/provider.dart';

class TimeList extends StatelessWidget {
  const TimeList({super.key, required this.project, required this.workPlace});
  final Project? project;
  final WorkPlace? workPlace;
  @override
  Widget build(BuildContext context) {
    return Consumer<TimerecordingProvider>(builder: (context, model, child) {
      return Container(
        height: 300,
        width: 350,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(30), color: const Color.fromARGB(255, 80, 73, 72)),
        child: ListView.builder(
            itemCount: model.workingTimesList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: const EdgeInsets.all(8),
                leading: Text(
                  '${project!.title}      ',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                ),
                title: Text(
                  '${workPlace!.title}    ',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                ),
                trailing: Text('${model.workingTimesList[index]}'),
                horizontalTitleGap: BorderSide.strokeAlignCenter,
                focusColor: Colors.amber,
                leadingAndTrailingTextStyle: const TextStyle(color: Colors.blue),
              );
            }),
      );
    });
  }
}
