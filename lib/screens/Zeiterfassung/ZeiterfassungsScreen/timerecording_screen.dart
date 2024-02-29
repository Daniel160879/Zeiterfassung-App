import 'package:flutter/material.dart';

import 'package:meine_zeiterfassungs_app/const/theme/theme.dart';

class TimeRecordingScreen extends StatelessWidget {
  final String project;
  final String workingSpace;
  const TimeRecordingScreen({super.key, required this.project, required this.workingSpace});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 80, 73, 72),
        title: const Text(
          'Timerecording Screen',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/background/background.png',
              ),
              fit: BoxFit.fill),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 35,
              ),
              const Text(
                textAlign: TextAlign.center,
                '00:00:00',
                style: myClockStyle,
              ),
              const SizedBox(
                height: 35,
              ),
              Container(
                height: 65,
                width: 300,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 80, 73, 72),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 30,
                          width: 100,
                          child: const Text(
                            'Project :',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 30,
                          width: 100,
                          child: Text(project),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Container(
                height: 65,
                width: 300,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 80, 73, 72),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 30,
                          width: 100,
                          child: const Text(
                            'Arbeitsplatz :',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 30,
                          width: 100,
                          child: Text(workingSpace, style: myTextStyle),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Start',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Stop',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
