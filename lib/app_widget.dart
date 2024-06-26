import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/screens/home_startScreen/start_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zeiterfasssungs app',
      home: StartScreen(),
    );
  }
}
