import 'package:meine_zeiterfassungs_app/screens/Users/data/user.dart';

abstract class UserRepository {
  Stream<List<User>> get users;
  Future<void> setUserCompletion(User user);
  void deletUser(User user);
  Future<User> loadUser(String id);
}
