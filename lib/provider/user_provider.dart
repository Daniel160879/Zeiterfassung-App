import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/screens/Users/data/user.dart';
import 'package:meine_zeiterfassungs_app/screens/Users/Repository/user_repository.dart';

enum UserStatus { loading, loaded, error }

class UserProvider extends ChangeNotifier {
  final UserRepository userRepository;
  late User currentUser;
  UserStatus userStatus = UserStatus.loading;
  List<User> usersList = [];

  UserProvider(this.userRepository) {
    _loadEmployers();
  }

  Future<void> addEmployers(User user) async {
    await userRepository.setUserCompletion(user);
    notifyListeners();
  }

  Future<void> loadCurrentUser(String id) async {
    final user = await userRepository.loadUser(id);
    currentUser = user;
    usersList.add(currentUser);
    notifyListeners();
  }

  Future<void> _loadEmployers() async {
    try {
      userRepository.users.listen((user) {
        usersList = user;
        userStatus = UserStatus.loaded;
        notifyListeners();
      });
    } catch (e) {
      userStatus = UserStatus.error;
      notifyListeners();
    }
  }
}
