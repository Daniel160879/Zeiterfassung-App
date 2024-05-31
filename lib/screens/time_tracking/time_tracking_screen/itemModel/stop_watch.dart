import 'dart:async';
import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/provider/timerec_provider.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/data/project.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/time_tracking_screen/data/working_time.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/working_space_screen/data/workplace.dart';
import 'package:provider/provider.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({
    super.key,
  });

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  Duration duration = const Duration();
  late Timer timer;
  late Project project;
  late WorkPlace workPlace;

  void addTime() {
    const addSeconds = 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      duration = Duration(seconds: seconds);
    });
  }

  void stop() {
    timer.cancel();
    WorkingTime workingTime = WorkingTime(
        hours: duration.inHours.remainder(24),
        minutes: duration.inMinutes.remainder(60),
        seconds: duration.inSeconds.remainder(60));
    context.read<TimerecordingProvider>().addWorkingTime(workingTime);
    duration = const Duration(seconds: 0, minutes: 0, hours: 0);
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (context) => addTime());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    final hours = twoDigits(duration.inHours.remainder(24));
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
