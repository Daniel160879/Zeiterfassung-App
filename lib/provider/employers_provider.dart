import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/screens/employers/data/employers.dart';
import 'package:meine_zeiterfassungs_app/screens/employers/Repository/employers_repository.dart';

enum EmployerStatus { loading, loaded, error }

class EmployersProvider extends ChangeNotifier {
  final EmployersRepository employersRepository;
  EmployerStatus employerStatus = EmployerStatus.loading;
  List<Employer> employersList = [];

  EmployersProvider(this.employersRepository) {
    _loadEmployers();
  }

  Future<void> addEmployers(Employer employer) async {
    await employersRepository.setEmployerCompletion(employer);
    notifyListeners();
  }

  Future<void> _loadEmployers() async {
    try {
      employersRepository.employers.listen((employers) {
        employersList = employers;
        employerStatus = EmployerStatus.loaded;
        notifyListeners();
      });
    } catch (e) {
      employerStatus = EmployerStatus.error;
      notifyListeners();
    }
  }
}
