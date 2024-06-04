import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/provider/project_provider.dart';
import 'package:meine_zeiterfassungs_app/provider/user_provider.dart';
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
                'neues Projekt erstellen',
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
                      'Projekt speichern',
                      style: TextStyle(color: Colors.white),
                    )),
              ]);
        },
      );

  void createProject() {
    Project project = Project(projectId: '', title: _projectController.text);
    Provider.of<ProjectProvider>(context, listen: false).addProject(project);
    _projectController.clear();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final ProjectProvider projectProviderModel = context.watch<ProjectProvider>();
    final UserProvider userProvider = context.watch<UserProvider>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 80, 73, 72),
          title: const Text('Projekte', style: myAppBarTextStyle)),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: myBoxdeco,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 70,
              ),
              userProvider.currentUser.isAdmin
                  ? ElevatedButton(
                      style: myCreateButtonStyle,
                      onPressed: () {
                        openDialog();
                      },
                      child: const Text(
                        'neues Projekt',
                        style: myBttnTextStyle,
                        textAlign: TextAlign.center,
                      ))
                  : const Center(
                      child: Text(
                      'Wähle ein Projekt',
                      style: TextStyle(fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold),
                    )),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 630,
                width: 400,
                child: switch (projectProviderModel.projectStatus) {
                  ProjectStatus.error => const Center(
                      child: Text('no data'),
                    ),
                  ProjectStatus.loaded => ListView.builder(
                      padding: const EdgeInsets.all(16),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: projectProviderModel.projectLists.length,
                      itemBuilder: (context, index) {
                        return userProvider.currentUser.isAdmin
                            ? Dismissible(
                                onDismissed: (direction) {
                                  projectProviderModel.projectRepository.deletProject(
                                    projectProviderModel.projectLists.removeAt(index),
                                  );
                                },
                                key: ValueKey(projectProviderModel.projectLists[index]),
                                child: ProjectItem(project: projectProviderModel.projectLists[index]),
                              )
                            : ProjectItem(project: projectProviderModel.projectLists[index]);
                      },
                    ),
                  ProjectStatus.loading => const Center(
                      child: CircularProgressIndicator(),
                    )
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
