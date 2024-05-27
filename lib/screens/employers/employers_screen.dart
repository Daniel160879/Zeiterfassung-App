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

  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
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
    );
    Provider.of<EmployersProvider>(context, listen: false).addEmployers(employers);
    _firstNameController.clear();
    _lastNameController.clear();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final EmployersProvider employersProvider = context.watch<EmployersProvider>();
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
                  backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 80, 73, 72)),
                  alignment: Alignment.center,
                  fixedSize: WidgetStatePropertyAll(Size(175, 70)),
                ),
                onPressed: () {
                  openDialog();
                },
                child: const Text('Neuen Mitarbeiter\nerstellen')),
            switch (employersProvider.employerStatus) {
              EmployerStatus.error => const Center(
                  child: Text('no data'),
                ),
              EmployerStatus.loaded => Center(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(16),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: employersProvider.employersList.length,
                      itemBuilder: ((context, index) {
                        return Dismissible(
                            onDismissed: (direction) {
                              employersProvider.employersList.removeAt(index);
                            },
                            key: ValueKey(employersProvider.employersList[index]),
                            child: EmployersItemModel(employer: employersProvider.employersList[index]));
                      })),
                ),
              EmployerStatus.loading => const Center(child: CircularProgressIndicator())
            }
          ],
        ),
      ),
    );
  }
}
