import 'package:meine_zeiterfassungs_app/screens/employers/data/employers.dart';

abstract class EmployersRepository {
  Stream<List<Employer>> get employers;
  Future<void> setEmployerCompletion(Employer employer);
  void deletEmployer(Employer employer);
  void resetEmployer();
}
