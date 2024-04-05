import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/constants/buttonStyle/button_styles.dart';
import 'package:meine_zeiterfassungs_app/constants/style/decoration.dart';
import 'package:meine_zeiterfassungs_app/constants/theme/theme.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/Data/project.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/working_space_screen/Data/workplace.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/working_space_screen/ItemModel/workplace_item.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/working_space_screen/Repository/workplace_repository.dart';

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

  Future<String?> openDialog() => showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 13, 13, 13),
          title: const Text(
            'create new projects',
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          actions: [
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 80, 73, 72),
                    ),
                  ),
                  labelText: 'Enter Arbeitplatz',
                  labelStyle: const TextStyle(color: Colors.white),
                  alignLabelWithHint: true,
                  helperStyle: const TextStyle(color: Colors.white54),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  floatingLabelAlignment: FloatingLabelAlignment.center),
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

  void createWorkplace() {
    setState(() {
      title = workspaceController.text;
      widget.workPlaceRepoitory.workPlaceMock.add(WorkPlace(title: title));
      workspaceController.clear();
      Navigator.of(context).pop();
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
                  height: 22,
                ),
                ElevatedButton(
                    style: myCreateButtonStyle,
                    onPressed: () async {
                      final workspace = await openDialog();
                      if (workspace == null || workspace.isEmpty) {
                        return;
                      }
                    },
                    child: const Text(
                      'create workingspace',
                      style: myBttnTextStyle,
                      textAlign: TextAlign.center,
                    )),
                const SizedBox(
                  height: 50,
                ),
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
                            return Dismissible(
                                onDismissed: (direction) {
                                  setState(() {
                                    widget.workPlaceRepoitory.workPlaceMock.removeAt(index);
                                  });
                                },
                                key: ValueKey(index),
                                child: WorkPlaceItem(project: widget.project, workPlace: snapshot.data![index]));
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
}
