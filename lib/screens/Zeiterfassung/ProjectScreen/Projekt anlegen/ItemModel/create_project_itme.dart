import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/ProjectScreen/Projekt%20anlegen/Data/data.dart';

class CreateProjectItem extends StatelessWidget {
  const CreateProjectItem({super.key, required this.createProject});

  final CreateProject createProject;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: null,
      ),
      child: Center(
        child: Column(
          children: [
            Container(
              height: 200,
              width: 300,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 80, 73, 72),
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
