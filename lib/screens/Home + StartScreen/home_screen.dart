import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/const/theme/theme.dart';
import 'package:meine_zeiterfassungs_app/screens/Kalender/calendar_screen.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/ProjectScreen/project_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 80, 73, 72),
        title: const Text('Home Screen', style: myAppBarTextStyle),
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
              ElevatedButton(
                style: myHomeButtonStyle,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseProjectScreen()));
                },
                child: const Text('Zeiterfassung', style: myTextStyle),
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
                child: const Text('Kalender', style: myTextStyle),
              ),
              ElevatedButton(
                style: myHomeButtonStyle,
                onPressed: () {},
                child: const Text('Logout', style: myTextStyle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
