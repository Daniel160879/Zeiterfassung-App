import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/provider/project_provider.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/data/project.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/ItemModel/project_item.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/decoration/projectscreen_decoration.dart';
import 'package:provider/provider.dart';
import '../../../decoration/buttonStyle/button_styles.dart';
import '../../../decoration/style/decoration.dart';
import '../../../decoration/theme/theme.dart';

class ChooseProjectScreen extends StatefulWidget {
  const ChooseProjectScreen({
    super.key,
  });

  @override
  State<ChooseProjectScreen> createState() => _ChooseProjectScreenState();
}

class _ChooseProjectScreenState extends State<ChooseProjectScreen> {
  final TextEditingController _projectController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _projectController.dispose();
  }

  void openDialog() => showDialog<String>(
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
                  decoration: myTextfieldDeco,
                  controller: _projectController,
                ),
                TextButton(
                    onPressed: () {
                      createProject();
                    },
                    child: const Text(
                      'create new project',
                      style: TextStyle(color: Colors.white),
                    )),
              ]);
        },
      );

  void createProject() {
    Project project = Project(_projectController.text);
    Provider.of<ProjectProvider>(context, listen: false).addProject(project);
    _projectController.clear();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 80, 73, 72),
          title: const Text('Project Screen')),
      body: Consumer<ProjectProvider>(builder: (context, model, child) {
        return Container(
          decoration: myBoxdeco,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 70,
                ),
                ElevatedButton(
                    style: myCreateButtonStyle,
                    onPressed: () {
                      openDialog();
                    },
                    child: const Text(
                      'create new project',
                      style: myBttnTextStyle,
                      textAlign: TextAlign.center,
                    )),
                const SizedBox(
                  height: 50,
                ),
                ListView.builder(
                  padding: const EdgeInsets.all(16),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: model.projectLists.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                        onDismissed: (direction) {
                          model.removeAt(index);
                          model.projectRepository.deleteProjects(model.projectLists);
                        },
                        key: ValueKey(model.projectLists[index]),
                        child: ProjectItem(project: model.projectLists[index]));
                  },
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
