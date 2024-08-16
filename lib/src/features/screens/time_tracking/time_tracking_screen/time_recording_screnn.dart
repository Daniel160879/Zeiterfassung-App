import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/src/decoration/style/decoration.dart';
import 'package:meine_zeiterfassungs_app/src/decoration/theme/theme.dart';
import 'package:meine_zeiterfassungs_app/src/features/auth/data/auth_repo.dart';
import 'package:meine_zeiterfassungs_app/src/features/provider/timerec_provider.dart';
import 'package:meine_zeiterfassungs_app/src/features/provider/user_provider.dart';
import 'package:meine_zeiterfassungs_app/src/features/screens/time_tracking/projectScreen/data/project.dart';
import 'package:meine_zeiterfassungs_app/src/features/screens/time_tracking/time_tracking_screen/itemModel/pro_u_arbeitsplatz.dart';
import 'package:meine_zeiterfassungs_app/src/features/screens/time_tracking/time_tracking_screen/itemModel/stop_watch.dart';
import 'package:meine_zeiterfassungs_app/src/features/screens/time_tracking/time_tracking_screen/itemModel/time_list.dart';
import 'package:meine_zeiterfassungs_app/src/features/screens/time_tracking/time_tracking_screen/itemModel/timelist_to_pdf.dart';
import 'package:meine_zeiterfassungs_app/src/features/screens/time_tracking/time_tracking_screen/repository/time_firebase_repository.dart';
import 'package:meine_zeiterfassungs_app/src/features/screens/time_tracking/working_space_screen/data/workplace.dart';
import 'package:provider/provider.dart';

class TimeRecordingScreen extends StatelessWidget {
  const TimeRecordingScreen({
    super.key,
    required this.project,
    required this.workPlace,
  });
  final Project project;
  final WorkPlace workPlace;

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    return ChangeNotifierProvider<TimerecordingProvider>(
      create: (context) => TimerecordingProvider(FirebaseTimeRepository(), AuthRepository(), project, workPlace),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Zeiterfassung', style: myAppBarTextStyle),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 80, 73, 72),
        ),
        body: Container(
          decoration: myBoxdeco,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TimeRecordingItem(project: project, workPlace: workPlace),
                const SizedBox(
                  height: 70,
                ),
                StopWatch(
                  project: project,
                  workPlace: workPlace,
                ),
                const SizedBox(
                  height: 70,
                ),
                userProvider.currentUser.isAdmin
                    ? ElevatedButton(
                        style:
                            const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 80, 73, 72))),
                        onPressed: () {
                          final myModel = context.read<TimerecordingProvider>();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ChangeNotifierProvider.value(value: myModel, child: const TimelistToPdf())));
                        },
                        child: const Text(
                          'Daten Ziehen',
                          style: myTextStyle,
                        ),
                      )
                    : const Text(''),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 80, 73, 72))),
                    onPressed: () {
                      final myModel = context.read<TimerecordingProvider>();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ChangeNotifierProvider.value(value: myModel, child: const TimeList())));
                    },
                    child: const Text(
                      'Arbeitszeiten',
                      style: myTextStyle,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
