import 'package:meine_zeiterfassungs_app/src/features/screens/Users/data/user.dart';

abstract class UserRepository {
  Stream<List<Users>> get users;
  Future<void> setUserCompletion(Users user);
  void deletUser(Users user);
  Future<Users> loadUser(String id);
}
