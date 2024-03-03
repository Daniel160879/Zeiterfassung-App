import 'package:meine_zeiterfassungs_app/screens/Mitarbeiter/Data/employers.dart';

class EmployersRepository {
  List<Mitarbeiter> getEmployers() {
    return mitarbeiterMock;
  }
}

final List<Mitarbeiter> mitarbeiterMock = [
  Mitarbeiter(firstName: 'Daniel', lastName: 'Händel', age: '34'),
  Mitarbeiter(firstName: 'Daniel', lastName: 'Händel', age: '34'),
  Mitarbeiter(firstName: 'Daniel', lastName: 'Händel', age: '34'),
  Mitarbeiter(firstName: 'Daniel', lastName: 'Händel', age: '34'),
];
