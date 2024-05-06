import 'package:meine_zeiterfassungs_app/screens/employers/data/employers.dart';

class EmployersRepository {
  List<Employers> mitarbeiterMock = [];

  Future<List<Employers>> getEmployers() async {
    return await Future.value(mitarbeiterMock);
  }

  void addMitarbeiter(Employers employers) {
    mitarbeiterMock.add(employers);
  }
}
