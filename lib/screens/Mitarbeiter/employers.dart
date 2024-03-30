import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/Konstanten/Style/decoration.dart';
import 'package:meine_zeiterfassungs_app/Konstanten/theme/theme.dart';
import 'package:meine_zeiterfassungs_app/screens/Mitarbeiter/Data/employers.dart';
import 'package:meine_zeiterfassungs_app/screens/Mitarbeiter/ItemModel/employers_item.dart';
import 'package:meine_zeiterfassungs_app/screens/Mitarbeiter/Repository/employers_repository.dart';

class MitarbeiterScreen extends StatefulWidget {
  const MitarbeiterScreen({super.key, required this.employersRepository});

  final EmployersRepository employersRepository;

  @override
  State<MitarbeiterScreen> createState() => _MitarbeiterScreenState();
}

class _MitarbeiterScreenState extends State<MitarbeiterScreen> {
  late Future<List<Mitarbeiter>> mitarbeiter;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  String firstName = '';
  String lastName = '';
  String age = '';

  @override
  void initState() {
    super.initState();
    mitarbeiter = widget.employersRepository.getEmployers();
  }

  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
  }

  Future<String?> openDialog() => showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 80, 73, 72),
          title: const Text('create new employers'),
          actions: [
            SizedBox(
              height: 70,
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'first name:',
                    labelText: 'wewer',
                    helperText: 'wedwefwefwefr',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                controller: _firstNameController,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 55,
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'last name:', border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                controller: _lastNameController,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 55,
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'age:', border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                controller: _ageController,
              ),
            ),
            TextButton(
                onPressed: () {
                  submit();
                },
                child: const Text('new employer'))
          ],
        );
      });
  void submit() {
    setState(() {
      firstName = _firstNameController.text;
      lastName = _lastNameController.text;
      age = _ageController.text;
      widget.employersRepository.mitarbeiterMock.add(Mitarbeiter(firstName: firstName, lastName: lastName, age: age));

      _firstNameController.clear();
      _lastNameController.clear();
      _ageController.clear();
      Navigator.of(context, rootNavigator: true).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mitarbeiter Übersicht',
          style: myAppBarTextStyle,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 80, 73, 72),
      ),
      body: Container(
        decoration: myBoxdeco,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 80, 73, 72)),
                  alignment: Alignment.center,
                  fixedSize: MaterialStatePropertyAll(Size(175, 70)),
                ),
                onPressed: () async {
                  final mitarbeiter = await openDialog();
                  if (mitarbeiter == null || mitarbeiter.isEmpty) {
                    return;
                  }
                },
                child: const Text('Neuen Mitarbeiter\nerstellen')),
            FutureBuilder<List<Mitarbeiter>>(
                future: mitarbeiter,
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
                        itemBuilder: ((context, index) {
                          return Dismissible(
                              onDismissed: (direction) {
                                setState(() {
                                  widget.employersRepository.mitarbeiterMock.removeAt(index);
                                });
                              },
                              key: ValueKey(index),
                              child: EmployersItemModel(mitarbeiter: snapshot.data![index]));
                        }));
                  } else {
                    return const Text('no data');
                  }
                })
          ],
        ),
      ),
    );
  }
}
