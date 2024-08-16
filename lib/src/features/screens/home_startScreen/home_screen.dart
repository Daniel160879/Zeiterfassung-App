import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/src/decoration/buttonStyle/button_styles.dart';
import 'package:meine_zeiterfassungs_app/src/decoration/style/decoration.dart';
import 'package:meine_zeiterfassungs_app/src/decoration/theme/theme.dart';
import 'package:meine_zeiterfassungs_app/src/features/provider/user_provider.dart';
import 'package:meine_zeiterfassungs_app/src/features/screens/Logout/logout.screen.dart';
import 'package:meine_zeiterfassungs_app/src/features/screens/Users/user_screen.dart';
import 'package:meine_zeiterfassungs_app/src/features/screens/calendar/calendar_screen.dart';
import 'package:meine_zeiterfassungs_app/src/features/screens/time_tracking/projectScreen/project_screen.dart';
import 'package:provider/provider.dart';

enum StatusCurrentUser { loading, loaded }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    final currentUser = _auth.currentUser;
    // print('hello currentuser $currentUser');
    if (currentUser != null) {
      const CircularProgressIndicator();
      // print('hello currentuser  333  $currentUser');
      context.read<UserProvider>().loadCurrentUser(currentUser.uid);
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 80, 73, 72),
        title: const Text('Home', style: myAppBarTextStyle),
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
              userProvider.currentUser.isAdmin
                  ? ElevatedButton(
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
                    )
                  : const Text(''),
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
