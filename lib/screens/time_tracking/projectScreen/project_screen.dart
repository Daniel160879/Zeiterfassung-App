import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/Data/project.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/ItemModel/project_item.dart';
import 'package:meine_zeiterfassungs_app/screens/time_tracking/projectScreen/Repository/project_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants/buttonStyle/button_styles.dart';
import '../../../constants/style/decoration.dart';
import '../../../constants/theme/theme.dart';

class ChooseProjectScreen extends StatefulWidget {
  const ChooseProjectScreen({super.key, required this.projectRepository});

  final ProjectRepository projectRepository;

  @override
  State<ChooseProjectScreen> createState() => _ChooseProjectScreenState();
}

class _ChooseProjectScreenState extends State<ChooseProjectScreen> {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  late Future<List<Project>> project;
  final TextEditingController _projectController = TextEditingController();
  String title = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _projectController.dispose();
  }

  void loadprefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      title = prefs.getString('title') ?? '';
    });
  }

  void savePrefs(String title) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('title', title);
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
                  decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 80, 73, 72),
                        ),
                      ),
                      labelText: 'Erstelle Projekt',
                      labelStyle: const TextStyle(color: Colors.white),
                      alignLabelWithHint: true,
                      helperStyle: const TextStyle(color: Colors.white54),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      floatingLabelAlignment: FloatingLabelAlignment.center),
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
    setState(() {
      title = _projectController.text;
      savePrefs(title);
      widget.projectRepository.projectMock.add(Project(title: title));
      _projectController.clear();
      Navigator.of(context).pop();
    });

    loadprefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 80, 73, 72),
          title: const Text('Project Screen')),
      body: Container(
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
                              setState(() {
                                widget.projectRepository.projectMock.removeAt(index);
                              });
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
