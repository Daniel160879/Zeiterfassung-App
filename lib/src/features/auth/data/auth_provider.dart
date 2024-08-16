import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/src/features/auth/data/auth_repo.dart';

enum AuthStatus { loading, loaded }

class AuthProvider extends ChangeNotifier {
  final AuthRepository authRepository;

  AuthProvider(this.authRepository);
  Stream<User?> get authStateChanges => authRepository.authStateChanges;
}
