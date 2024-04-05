import 'package:meine_zeiterfassungs_app/screens/employers/Data/employers.dart';

class EmployersRepository {
  List<Mitarbeiter> mitarbeiterMock = [];

  Future<List<Mitarbeiter>> getEmployers() async {
    return await Future.value(mitarbeiterMock);
  }

  void addMitarbeiter(Mitarbeiter mitarbeiter) {
    mitarbeiterMock.add(mitarbeiter);
  }
}
