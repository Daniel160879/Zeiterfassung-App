import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/decoration/style/decoration.dart';
import 'package:meine_zeiterfassungs_app/provider/user_provider.dart';
import 'package:meine_zeiterfassungs_app/screens/calendar/calendar_screen.dart';
import 'package:meine_zeiterfassungs_app/screens/logout/logout.screen.dart';
import 'package:meine_zeiterfassungs_app/screens/Users/user_screen.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/project_screen.dart';
import 'package:provider/provider.dart';

import '../../decoration/buttonStyle/button_styles.dart';
import '../../decoration/theme/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //  final UserProvider userProvider = context.watch<UserProvider>();
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ChooseProjectScreen()));
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
              //  userProvider.usersList.any(
              //  (element) => element.isAdmin,
              //) ?
              ElevatedButton(
                style: myHomeButtonStyle,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MitarbeiterScreen(
                                userRepository: context.read<UserProvider>().userRepository,
                              )));
                },
                child: const Text(
                  'Mitarbeiter',
                  style: myBttnTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              //:
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
