import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/Konstanten/Style/decoration.dart';
import 'package:meine_zeiterfassungs_app/Konstanten/theme/theme.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/ProjectScreen/Data/project.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/WorkingSpaceScreen/Data/workplace.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/WorkingSpaceScreen/ItemModel/workplace_item.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/WorkingSpaceScreen/Repository/workplace_repository.dart';

class ChooseWorkingSpace extends StatefulWidget {
  const ChooseWorkingSpace({super.key, required this.project, required this.workPlaceRepoitory});
  final Project project;
  final WorkPlaceRepoitory workPlaceRepoitory;

  @override
  State<ChooseWorkingSpace> createState() => _ChooseWorkingSpaceState();
}

class _ChooseWorkingSpaceState extends State<ChooseWorkingSpace> {
  late Future<List<WorkPlace>> workPlace;
  final workspaceController = TextEditingController();
  String title = '';

  @override
  void initState() {
    super.initState();
    workPlace = widget.workPlaceRepoitory.getWorkPlace();
  }

  @override
  void dispose() {
    super.dispose();
    workspaceController.dispose();
  }

  void createWorkplace() {
    setState(() {
      title = workspaceController.text;
      widget.workPlaceRepoitory.workPlaceMock.add(WorkPlace(title: title));
      workspaceController.clear();
      Navigator.of(context, rootNavigator: true).pop();
    });
  }

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
          decoration: myBoxdeco,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        const Text(
                          'Project',
                          style: myHeadBttnTextStyle,
                        ),
                        const Divider(
                          color: Colors.black,
                          thickness: 2,
                        ),
                        Text(
                          widget.project.title,
                          style: myTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final workspace = await openDialog();
                      if (workspace == null || workspace.isEmpty) {
                        return;
                      }
                    },
                    child: const Text('create workingspace')),
                FutureBuilder(
                    future: workPlace,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error : ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return WorkPlaceItem(project: widget.project, workPlace: snapshot.data![index]);
                          },
                        );
                      } else {
                        return const Text('no Data');
                      }
                    })
              ],
            ),
          ),
        ));
  }

  Future<String?> openDialog() => showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('create workspace'),
          actions: [
            TextField(
              controller: workspaceController,
            ),
            TextButton(
                onPressed: () {
                  createWorkplace();
                  workspaceController.clear();
                },
                child: const Text('create workspace'))
          ],
        );
      });
}
