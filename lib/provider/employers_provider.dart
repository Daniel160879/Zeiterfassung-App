import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/screens/employers/data/employers.dart';
import 'package:meine_zeiterfassungs_app/screens/employers/Repository/employers_repository.dart';

class EmployersProvider extends ChangeNotifier {
  final EmployersRepository employersRepository;
  List<Employer> employersList = [];

  EmployersProvider(this.employersRepository) {
    _loadEmployers();
  }

  void addEmployers(Employer employer) {
    employersList.add(employer);
    employersRepository.saveEmployers(employersList);
    notifyListeners();
  }

  Future<void> _loadEmployers() async {
    employersList = await employersRepository.loadEmployers();
    notifyListeners();
  }

  void removeEmployers(Employer employer) {
    employersList.remove(employer);
    employersRepository.deleteEmployers(employersList);
    notifyListeners();
  }

  void removeAt(int index) {
    employersList.removeAt(index);
    notifyListeners();
  }
}
