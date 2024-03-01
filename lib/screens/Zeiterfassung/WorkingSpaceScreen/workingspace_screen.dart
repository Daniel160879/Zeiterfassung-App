import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/const/theme/theme.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/ProjectScreen/Data/project.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/WorkingSpaceScreen/Data/workplace.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/WorkingSpaceScreen/ItemModel/workplace_item.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/WorkingSpaceScreen/Repository/workplace_repository.dart';

class ChooseWorkingSpace extends StatefulWidget {
  final Project project;

  const ChooseWorkingSpace({super.key, required this.project});

  @override
  State<ChooseWorkingSpace> createState() => _ChooseWorkingSpaceState();
}

class _ChooseWorkingSpaceState extends State<ChooseWorkingSpace> {
  final workPlace = WorkPlaceRepoitory().getWorkPlace();
  final List<WorkPlace> workPlaceList = [];
  final List workPlaceItem = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 80, 73, 72),
          title: const Text(
            'Working space Screen',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/background/background.png',
                ),
                fit: BoxFit.fill),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 125,
                  width: 300,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: Color.fromARGB(255, 80, 73, 72),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Project',
                          style: myAppBarTextStyle,
                        ),
                        const Divider(
                          color: Colors.black,
                          thickness: 2,
                        ),
                        Text(widget.project.title),
                      ],
                    ),
                  ),
                ),

                for (final workPlaceList in workPlace)
                  WorkPlaceItem(
                    project: widget.project,
                    workplace: workPlaceList,
                  ) //wefwefwefwefwef
              ],
            ),
          ),
        ));
  }
}