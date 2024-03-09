import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/const/theme/theme.dart';
import 'package:meine_zeiterfassungs_app/screens/Mitarbeiter/Data/employers.dart';
import 'package:meine_zeiterfassungs_app/screens/Mitarbeiter/ItemModel/employers_item.dart';
import 'package:meine_zeiterfassungs_app/screens/Mitarbeiter/Repository/employers_repository.dart';

class MitarbeiterScreen extends StatelessWidget {
  MitarbeiterScreen({super.key});

  final mitarbeiters = EmployersRepository().getEmployers();
  final List<Mitarbeiter> mitarbeiterList = [];
  final List mitarbeiterItem = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mitarbeiter Übersicht',
          style: myAppBarTextStyle,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 80, 73, 72),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/background/background.png',
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            for (final mitarbeiter in mitarbeiters) EmployersItemModel(mitarbeiter: mitarbeiter),
          ],
        ),
      ),
    );
  }
}
