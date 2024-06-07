import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/provider/auth_provider.dart';
import 'package:meine_zeiterfassungs_app/screens/home_startScreen/home_screen.dart';

import 'package:meine_zeiterfassungs_app/screens/home_startScreen/start_screen.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('de'),
      debugShowCheckedModeBanner: false,
      title: 'Zeiterfasssungs app',
      home: Consumer<AuthProvider>(builder: (context, authModel, child) {
        return StreamBuilder<auth.User?>(
            stream: authModel.authStateChanges,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const HomeScreen();
              }
              return const StartScreen();
            });
      }),
    );
  }
}
