import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/WorkingSpaceScreen/Data/workplace.dart';

class WorkPlaceRepoitory {
  List<WorkPlace> getWorkPlace() {
    return workPlaceMock;
  }
}

List<WorkPlace> workPlaceMock = [
  WorkPlace(
    title: 'Sägen',
    color: const Color.fromARGB(255, 80, 73, 72),
  ),
  WorkPlace(
    title: 'Bohren',
    color: const Color.fromARGB(255, 80, 73, 72),
  ),
  WorkPlace(
    title: 'Zusammenbau',
    color: const Color.fromARGB(255, 80, 73, 72),
  ),
  WorkPlace(
    title: 'Schweißen',
    color: const Color.fromARGB(255, 80, 73, 72),
  ),
  WorkPlace(
    title: 'Verputzen',
    color: const Color.fromARGB(255, 80, 73, 72),
  ),
];
