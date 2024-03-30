import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/ProjectScreen/Data/project.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/ProjectScreen/ItemModel/project_item.dart';
import 'package:meine_zeiterfassungs_app/screens/Zeiterfassung/ProjectScreen/Repository/project_repository.dart';

class ChooseProjectScreen extends StatefulWidget {
  const ChooseProjectScreen({super.key, required this.projectRepository});

  final ProjectRepository projectRepository;

  @override
  State<ChooseProjectScreen> createState() => _ChooseProjectScreenState();
}

class _ChooseProjectScreenState extends State<ChooseProjectScreen> {
  late Future<List<Project>> project;
  final TextEditingController _projectController = TextEditingController();
  late String title = '';

  @override
  void initState() {
    super.initState();
    project = widget.projectRepository.getProject();
  }

  @override
  void dispose() {
    super.dispose();
    _projectController.dispose();
  }

  Future<String?> openDialog() => showDialog<String>(
        context: context,
        builder: (context) {
          return AlertDialog(
              backgroundColor: const Color.fromARGB(255, 80, 73, 72),
              title: const Text('create new projects'),
              actions: [
                SizedBox(
                  height: 70,
                  width: 250,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Project Title:',
                        counterText: 'sdfewr',
                        helperText: 'wedwefwefwefr',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                    controller: _projectController,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      createProject();
                    },
                    child: const Text('create new project')),
              ]);
        },
      );

  void createProject() {
    setState(() {
      title = _projectController.text;
      widget.projectRepository.projectMock.add(Project(title: title));

      _projectController.clear();
      Navigator.of(context, rootNavigator: true).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 80, 73, 72),
          title: const Text('Project Screen')),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 70,
              ),
              ElevatedButton(
                  onPressed: () async {
                    final project = await openDialog();
                    if (project == null || project.isEmpty) {
                      return;
                    }
                  },
                  child: const Text('create new project')),
              FutureBuilder(
                future: project,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Keine daten vorhanden: ${snapshot.hasError}');
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      padding: const EdgeInsets.all(16),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                            onDismissed: (direction) {
                              widget.projectRepository.projectMock.removeAt(index);
                            },
                            key: ValueKey(index),
                            child: ProjectItem(project: snapshot.data![index]));
                      },
                    );
                  } else {
                    return const Text('data');
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
