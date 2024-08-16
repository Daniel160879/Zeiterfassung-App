import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:meine_zeiterfassungs_app/app_widget.dart';
import 'package:meine_zeiterfassungs_app/src/features/auth/data/auth_provider.dart';
import 'package:meine_zeiterfassungs_app/src/features/auth/data/auth_repo.dart';
import 'package:meine_zeiterfassungs_app/src/features/provider/project_provider.dart';
import 'package:meine_zeiterfassungs_app/src/features/provider/user_provider.dart';
import 'package:meine_zeiterfassungs_app/src/features/provider/workingspace_provider.dart';
import 'package:meine_zeiterfassungs_app/src/features/screens/Users/Repository/user_firebase_repo.dart';
import 'package:meine_zeiterfassungs_app/src/features/screens/time_tracking/projectScreen/repository/project_firebase_repo.dart';
import 'package:meine_zeiterfassungs_app/src/features/screens/time_tracking/working_space_screen/repository/workplace_firebase_repository.dart';
import 'package:meine_zeiterfassungs_app/src/features/screens/time_tracking/working_space_screen/repository/workplace_repository.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  initializeDateFormatting();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseEmployerRepository userRepository = FirebaseEmployerRepository();
  FirebaseWorkPlaceRepository workPlaceRepoitory = FirebaseWorkPlaceRepository();
  FirebaseProjectRepository projectRepository = FirebaseProjectRepository();
  AuthRepository authRepository = AuthRepository();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProjectProvider(projectRepository)),
        ChangeNotifierProvider(create: (context) => WorkingPlaceProvider(workPlaceRepoitory as WorkPlaceRepoitory)),
        ChangeNotifierProvider(create: (context) => UserProvider(userRepository)),
        ChangeNotifierProvider(create: (context) => AuthProvider(authRepository)),
      ],
      child: const MyApp(),
    ),
  );
}
