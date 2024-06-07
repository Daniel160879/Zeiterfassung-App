import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/provider/user_provider.dart';
import 'package:meine_zeiterfassungs_app/provider/workingspace_provider.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/data/project.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/working_space_screen/data/workplace.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/working_space_screen/decoration/deco.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/working_space_screen/itemModel/workplace_item.dart';
import 'package:provider/provider.dart';
import '../../../decoration/buttonStyle/button_styles.dart';
import '../../../decoration/style/decoration.dart';
import '../../../decoration/theme/theme.dart';

class ChooseWorkingSpace extends StatefulWidget {
  const ChooseWorkingSpace({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  State<ChooseWorkingSpace> createState() => _ChooseWorkingSpaceState();
}

class _ChooseWorkingSpaceState extends State<ChooseWorkingSpace> {
  final workspaceController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    workspaceController.dispose();
  }

  void openDialog() => showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 13, 13, 13),
          title: const Text(
            'neuen Arbeitsplatz erstellen',
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          actions: [
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: myWorkplaceDeco,
              controller: workspaceController,
            ),
            TextButton(
                onPressed: () {
                  createWorkplace();
                },
                child: const Text('Arbeitsplatz speichern'))
          ],
        );
      });

  void createWorkplace() {
    WorkPlace workPlace = WorkPlace(workPlaceId: '', title: workspaceController.text);
    Provider.of<WorkingPlaceProvider>(context, listen: false).addWorkPlace(workPlace);
    workspaceController.clear();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final workplaceModel = context.watch<WorkingPlaceProvider>();
    final userProvider = context.watch<UserProvider>();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 80, 73, 72),
          title: const Text('Arbeitsplätze', style: myAppBarTextStyle),
        ),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
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
                            'Projekt',
                            style: myHeadBttnTextStyle,
                          ),
                          const Divider(
                            color: Colors.black,
                            thickness: 2,
                          ),
                          Text(
                            widget.project.title,
                            style: myHeadBttnTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  userProvider.currentUser.isAdmin
                      ? ElevatedButton(
                          style: myCreateButtonStyle,
                          onPressed: () {
                            openDialog();
                          },
                          child: const Text(
                            'neuer Arbeitsplatz',
                            style: myBttnTextStyle,
                            textAlign: TextAlign.center,
                          ))
                      : const Center(
                          child: Text(
                            'Wähle einen Arbeitsplatz',
                            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 523,
                    width: 400,
                    child: switch (workplaceModel.workplaceStatus) {
                      WorkplaceStatus.error => const Center(
                          child: Text('no data'),
                        ),
                      WorkplaceStatus.loaded => ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(16),
                          itemCount: workplaceModel.workPlacesList.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return userProvider.currentUser.isAdmin
                                ? Dismissible(
                                    onDismissed: (direction) {
                                      workplaceModel.workPlacesList.removeAt(index);
                                      workplaceModel.workPlaceRepoitory
                                          .deleteWorkPlace(workplaceModel.workPlacesList[index]);
                                    },
                                    key: ValueKey(workplaceModel.workPlacesList[index]),
                                    child: WorkplaceItem(
                                      project: widget.project,
                                      workplace: workplaceModel.workPlacesList[index],
                                    ))
                                : WorkplaceItem(
                                    project: widget.project,
                                    workplace: workplaceModel.workPlacesList[index],
                                  );
                          },
                        ),
                      WorkplaceStatus.loading => const Center(
                          child: CircularProgressIndicator(),
                        ),
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
