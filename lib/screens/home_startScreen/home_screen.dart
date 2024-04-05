import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/screens/calendar/calendar_screen.dart';
import 'package:meine_zeiterfassungs_app/screens/logout/logout.screen.dart';
import 'package:meine_zeiterfassungs_app/screens/employers/Repository/employers_repository.dart';
import 'package:meine_zeiterfassungs_app/screens/employers/employers.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/Repository/project_repository.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/project_screen.dart';
import '../../constants/Style/decoration.dart';
import '../../constants/buttonStyle/button_styles.dart';
import '../../constants/theme/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProjectRepository projectRepository = ProjectRepository();
    EmployersRepository employersRepository = EmployersRepository();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 80, 73, 72),
        title: const Text('Home Screen', style: myAppBarTextStyle),
      ),
      body: Container(
        decoration: myBoxdeco,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: myHomeButtonStyle,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChooseProjectScreen(
                                projectRepository: projectRepository,
                              )));
                },
                child: const Text('Zeiterfassung', style: myBttnTextStyle),
              ),
              ElevatedButton(
                style: myHomeButtonStyle,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CalendarScreen(),
                      ));
                },
                child: const Text('Kalender', style: myBttnTextStyle),
              ),
              ElevatedButton(
                style: myHomeButtonStyle,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MitarbeiterScreen(
                                employersRepository: employersRepository,
                              )));
                },
                child: const Text(
                  'Mitarbeiter Liste',
                  style: myBttnTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                style: myHomeButtonStyle,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LogoutScreen()));
                },
                child: const Text('Logout', style: myBttnTextStyle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
