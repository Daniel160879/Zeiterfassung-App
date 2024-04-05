import 'dart:async';
import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({
    super.key,
  });

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  Duration duration = const Duration();
  Timer? timer;
  String timeOfDay = '';

  void addTime() {
    const addSeconds = 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      duration = Duration(seconds: seconds);
    });
  }

  void stop() {
    setState(() {
      timer?.cancel();
      timeOfDay = timer.toString();
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

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
                style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 191, 236, 147))),
                onPressed: startTimer,
                child: const Text('Start')),
            ElevatedButton(
                style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 228, 84, 84))),
                onPressed: stop,
                child: const Text('Stop')),
          ],
        )
      ],
    );
  }
}
