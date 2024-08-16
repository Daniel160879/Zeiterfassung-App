import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/src/features/auth/data/auth_provider.dart';
import 'package:meine_zeiterfassungs_app/src/features/screens/home_startScreen/home_screen.dart';
import 'package:meine_zeiterfassungs_app/src/features/screens/home_startScreen/start_screen.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authModel, child) {
      return MaterialApp(
        locale: const Locale('de'),
        debugShowCheckedModeBanner: false,
        title: 'Zeiterfasssungs app',
        home: StreamBuilder<auth.User?>(
          stream: authModel.authStateChanges,
          builder: (context, snapshot) {
            if (authModel.authRepository.firebaseAuth.currentUser != null) {
              return const HomeScreen();
            } else {
              return const StartScreen();
            }
          },
        ),
      );
    });
  }
}
