import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/screens/employers/data/employers.dart';
import 'package:meine_zeiterfassungs_app/screens/employers/Repository/employers_repository.dart';

class EmployersProvider extends ChangeNotifier {
  final EmployersRepository employersRepository;
  List<Employers> employersList = [];

  EmployersProvider(this.employersRepository) {
    _loadEmployers();
  }

  void addEmployers(Employers employers) {
    employersList.add(employers);
    notifyListeners();
  }

  void _loadEmployers() {
    employersRepository.getEmployers();
    notifyListeners();
  }

  void removeEmployers(Employers employers) {
    employersList.remove(employers);
    notifyListeners();
  }

  void removeAt(int index) {
    employersList.removeAt(index);
    notifyListeners();
  }
}
