import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/const/theme/theme.dart';

class MitarbeiterAnlegenScrenn extends StatelessWidget {
  const MitarbeiterAnlegenScrenn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('asdqfad', style: myAppBarTextStyle),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 80, 73, 72),
      ),
    );
  }
}
