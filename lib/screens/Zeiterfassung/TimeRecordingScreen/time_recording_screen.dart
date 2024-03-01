import 'package:flutter/material.dart';

class TimeRecordingScreen extends StatelessWidget {
  final String workPlace;
  final String project;
  const TimeRecordingScreen({super.key, required this.project, required this.workPlace});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zeiterfassung'),
      ),
    );
  }
}
