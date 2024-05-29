import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/app_widget.dart';
import 'package:meine_zeiterfassungs_app/provider/user_provider.dart';
import 'package:meine_zeiterfassungs_app/provider/project_provider.dart';
import 'package:meine_zeiterfassungs_app/provider/timerec_provider.dart';
import 'package:meine_zeiterfassungs_app/provider/workingspace_provider.dart';
import 'package:meine_zeiterfassungs_app/screens/Users/Repository/user_firebase_repo.dart';
import 'package:meine_zeiterfassungs_app/screens/Users/Repository/user_repository.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/repository/project_firebase_repo.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/repository/project_repository.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/time_tracking_screen/repository/time_firebase_repository.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/time_tracking_screen/repository/time_repository.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/working_space_screen/repository/workplace_firebase_repository.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/working_space_screen/repository/workplace_repository.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  TimeRepoitory timeRepository = FirebaseTimeRepository();
  UserRepository employersRepository = FirebaseEmployerRepository();
  WorkPlaceRepoitory workPlaceRepoitory = FirebaseWorkPlaceRepository();
  ProjectRepository projectRepository = FirebaseProjectRepository();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TimerecordingProvider(timeRepository)),
        ChangeNotifierProvider(create: (context) => ProjectProvider(projectRepository)),
        ChangeNotifierProvider(create: (context) => WorkingPlaceProvider(workPlaceRepoitory)),
        ChangeNotifierProvider(create: (context) => UserProvider(employersRepository)),
      ],
      child: const MyApp(),
    ),
  );
}
