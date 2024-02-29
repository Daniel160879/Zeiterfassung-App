import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/const/theme/theme.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/WorkingSpaceScreen/data/working.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/ZeiterfassungsScreen/timerecording_screen.dart';

class ChooseWorkingSpace extends StatefulWidget {
  final String project;

  const ChooseWorkingSpace({super.key, required this.project});

  @override
  State<ChooseWorkingSpace> createState() => _ChooseWorkingSpaceState();
}

Working working1 = Working(title: 'Sägen');
Working working2 = Working(title: 'Bohren');
Working working3 = Working(title: 'Zusammenbau');
Working working4 = Working(title: 'Schweißen');
Working working5 = Working(title: 'Verputzen');

class _ChooseWorkingSpaceState extends State<ChooseWorkingSpace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 80, 73, 72),
        title: const Text(
          'Working space Screen',
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 125,
                width: 300,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  color: Color.fromARGB(255, 80, 73, 72),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Project',
                        style: myAppBarTextStyle,
                      ),
                      const Divider(
                        color: Colors.black,
                        thickness: 2,
                      ),
                      Text(widget.project),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                style: myWorkingSpaceButtonStyle,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TimeRecordingScreen(
                                project: widget.project,
                                workingSpace: working1.title,
                              )));
                },
                child: const Text('Sägen',
                    style: TextStyle(shadows: <Shadow>[
                      Shadow(offset: Offset(10, 10), blurRadius: 3.0, color: Colors.red),
                    ])),
              ),
              ElevatedButton(
                style: myWorkingSpaceButtonStyle,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TimeRecordingScreen(
                                project: widget.project,
                                workingSpace: working2.title,
                              )));
                },
                child: const Text(
                  'Bohren',
                  style: myTextStyle,
                ),
              ),
              ElevatedButton(
                style: myWorkingSpaceButtonStyle,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TimeRecordingScreen(
                                project: widget.project,
                                workingSpace: working3.title,
                              )));
                },
                child: const Text(
                  'Zusammenbau',
                  style: myTextStyle,
                ),
              ),
              ElevatedButton(
                style: myWorkingSpaceButtonStyle,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TimeRecordingScreen(
                                project: widget.project,
                                workingSpace: working4.title,
                              )));
                },
                child: const Text(
                  'schweißen',
                  style: myTextStyle,
                ),
              ),
              ElevatedButton(
                style: myWorkingSpaceButtonStyle,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TimeRecordingScreen(
                                project: widget.project,
                                workingSpace: working5.title,
                              )));
                },
                child: const Text(
                  'verputzen',
                  style: myTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
