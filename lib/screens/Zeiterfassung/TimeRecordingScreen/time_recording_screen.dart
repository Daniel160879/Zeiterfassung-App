import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/const/theme/theme.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/ProjectScreen/Data/project.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/WorkingSpaceScreen/Data/workplace.dart';

class TimeRecordingScreen extends StatelessWidget {
  const TimeRecordingScreen({super.key, required this.project, required this.workPlace});

  final WorkPlace workPlace;
  final Project project;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 80, 73, 72),
        title: const Text(
          'Zeiterfassung',
          style: myAppBarTextStyle,
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/background/background.png',
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            const Text(
              '00:00:00',
              style: myClockStyle,
            ),
            Container(
              height: 60,
              width: 300,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 80, 73, 72),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('Project :'),
                  Text(project.title),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 60,
              width: 300,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 80, 73, 72),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('Arbeitsplatz :'),
                  Text(workPlace.title),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
