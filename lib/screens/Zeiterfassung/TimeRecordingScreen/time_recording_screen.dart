import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/const/theme/theme.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/ProjectScreen/Data/project.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/WorkingSpaceScreen/Data/workplace.dart';

class TimeRecordingScreen extends StatefulWidget {
  const TimeRecordingScreen({super.key, required this.project, required this.workPlace});

  final WorkPlace workPlace;
  final Project project;

  @override
  State<TimeRecordingScreen> createState() => _TimeRecordingScreenState();
}

class _TimeRecordingScreenState extends State<TimeRecordingScreen> {
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
            const Text(
              'Montag der 23.02.2024',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              '00:00:00',
              style: myClockStyle,
            ),
            const SizedBox(
              height: 70,
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
                  const Text(
                    'Project :',
                    style: myAppBarTextStyle,
                  ),
                  Text(
                    widget.project.title,
                    style: myTextStyle,
                  ),
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
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green)),
                  onPressed: () {},
                  child: const Text(
                    'Start',
                    style: myTextStyle,
                  ),
                ),
                ElevatedButton(
                  style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),
                  onPressed: () {},
                  child: const Text(
                    'Stop',
                    style: myTextStyle,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              alignment: Alignment.center,
              height: 200,
              width: 300,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
                color: Color.fromARGB(255, 80, 73, 72),
              ),
              child: const Text('data'),
            ),
          ],
        ),
      ),
    );
  }
}
