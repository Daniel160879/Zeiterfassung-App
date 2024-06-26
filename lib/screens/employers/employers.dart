import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/provider/employers_provider.dart';
import 'package:meine_zeiterfassungs_app/screens/employers/data/employers.dart';
import 'package:meine_zeiterfassungs_app/screens/employers/ItemModel/employers_item.dart';
import 'package:meine_zeiterfassungs_app/screens/employers/Repository/employers_repository.dart';
import 'package:provider/provider.dart';

import '../../decoration/style/decoration.dart';
import '../../decoration/theme/theme.dart';

class MitarbeiterScreen extends StatefulWidget {
  const MitarbeiterScreen({super.key, required this.employersRepository});

  final EmployersRepository employersRepository;

  @override
  State<MitarbeiterScreen> createState() => _MitarbeiterScreenState();
}

class _MitarbeiterScreenState extends State<MitarbeiterScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
  }

  void openDialog() => showDialog<String>(
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
                  createEmployers();
                },
                child: const Text('new employer'))
          ],
        );
      });
  void createEmployers() {
    Employer employers = Employer(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      age: _ageController.text,
    );
    Provider.of<EmployersProvider>(context, listen: false).addEmployers(employers);
    _firstNameController.clear();
    _lastNameController.clear();
    _ageController.clear();
    Navigator.of(context).pop();
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
      body: Consumer<EmployersProvider>(builder: (context, model, child) {
        return Container(
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
                  onPressed: () {
                    openDialog();
                  },
                  child: const Text('Neuen Mitarbeiter\nerstellen')),
              ListView.builder(
                  padding: const EdgeInsets.all(16),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: model.employersList.length,
                  itemBuilder: ((context, index) {
                    return Dismissible(
                        onDismissed: (direction) {
                          model.employersList.removeAt(index);
                          model.employersRepository.deleteEmployers(model.employersList);
                        },
                        key: ValueKey(model.employersList[index]),
                        child: EmployersItemModel(employer: model.employersList[index]));
                  }))
            ],
          ),
        );
      }),
    );
  }
}
