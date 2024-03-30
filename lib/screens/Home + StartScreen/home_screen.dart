import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/Konstanten/Style/decoration.dart';
import 'package:meine_zeiterfassungs_app/Konstanten/theme/theme.dart';
import 'package:meine_zeiterfassungs_app/screens/Kalender/calendar_screen.dart';
import 'package:meine_zeiterfassungs_app/screens/Logout/logout.screen.dart';
import 'package:meine_zeiterfassungs_app/screens/Mitarbeiter/Repository/employers_repository.dart';
import 'package:meine_zeiterfassungs_app/screens/Mitarbeiter/employers.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/ProjectScreen/Repository/project_repository.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/ProjectScreen/project_screen.dart';

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
                child: const Text('Mitarbeiter Liste', style: myBttnTextStyle),
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
