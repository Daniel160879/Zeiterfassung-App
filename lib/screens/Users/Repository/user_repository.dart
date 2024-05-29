import 'package:meine_zeiterfassungs_app/screens/Users/data/user.dart';

abstract class UserRepository {
  Stream<List<User>> get users;
  Future<void> setEmployerCompletion(User user);
  void deletEmployer(User user);
  void resetEmployer();
}
