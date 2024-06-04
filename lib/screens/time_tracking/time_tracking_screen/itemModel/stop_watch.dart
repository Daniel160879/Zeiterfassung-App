import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/provider/auth_provider.dart';
import 'package:meine_zeiterfassungs_app/provider/timerec_provider.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/data/project.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/time_tracking_screen/data/working_time.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/working_space_screen/data/workplace.dart';
import 'package:provider/provider.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key, required this.project, required this.workPlace});
  final Project project;
  final WorkPlace workPlace;

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  late DateTime dateTime = DateTime.timestamp();
  Stopwatch stopwatch = Stopwatch();
  Timer? timer;

  void stop() {
    stopwatch.stop();

    WorkingTime workingTime = WorkingTime(
      workday: dateTime.day.toString(),
      projectTitle: widget.project.title,
      workplaceTitle: widget.workPlace.title,
      hours: stopwatch.elapsed.inHours.remainder(24),
      minutes: stopwatch.elapsed.inMinutes.remainder(60),
      seconds: stopwatch.elapsed.inSeconds.remainder(60),
      workingTimeId: '',
    );

    context.read<TimerecordingProvider>().addWorkingTimeToUser(workingTime, widget.project,
        context.read<AuthProvider>().authRepository.firebaseAuth.currentUser!.uid, widget.workPlace);
    timer?.cancel();
    stopwatch.reset();
  }

  void startTimer() {
    stopwatch.start();
    // ??= nur wenn timer null ist == timer.start
    timer ??= Timer.periodic(const Duration(milliseconds: 200), (_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
    timer = null;
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(stopwatch.elapsed.inMinutes.remainder(60));
    final seconds = twoDigits(stopwatch.elapsed.inSeconds.remainder(60));
    final hours = twoDigits(stopwatch.elapsed.inHours.remainder(24));
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 102,
              width: 102,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    hours,
                    style: const TextStyle(fontSize: 50),
                  ),
                  const Text('Hours')
                ],
              ),
            ),
            Container(
              height: 102,
              width: 102,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    minutes,
                    style: const TextStyle(fontSize: 50),
                  ),
                  const Text('Minutes')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 102,
                width: 102,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                child: Column(
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      seconds,
                      style: const TextStyle(fontSize: 50),
                    ),
                    const Text('Seconds')
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 191, 236, 147))),
                onPressed: startTimer,
                child: const Text('Start')),
            ElevatedButton(
                style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 228, 84, 84))),
                onPressed: stop,
                child: const Text('Stop')),
          ],
        )
      ],
    );
  }
}
