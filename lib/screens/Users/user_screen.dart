import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/provider/user_provider.dart';
import 'package:meine_zeiterfassungs_app/screens/Users/data/user.dart';
import 'package:meine_zeiterfassungs_app/screens/Users/ItemModel/user_item.dart';
import 'package:meine_zeiterfassungs_app/screens/Users/Repository/user_repository.dart';
import 'package:provider/provider.dart';
import '../../decoration/style/decoration.dart';
import '../../decoration/theme/theme.dart';

class MitarbeiterScreen extends StatefulWidget {
  const MitarbeiterScreen({super.key, required this.userRepository});

  final UserRepository userRepository;

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
                child: const Text('New User'))
          ],
        );
      });
  void createEmployers() {
    User user =
        User(userId: '', firstName: _firstNameController.text, lastName: _lastNameController.text, isAdmin: false);
    Provider.of<UserProvider>(context, listen: false).addEmployers(user);
    _firstNameController.clear();
    _lastNameController.clear();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = context.watch<UserProvider>();
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
                child: const Text(
                  'Neuen Mitarbeiter\nerstellen',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                  textAlign: TextAlign.center,
                )),
            switch (userProvider.userStatus) {
              UserStatus.error => const Center(
                  child: Text('no data'),
                ),
              UserStatus.loaded => Center(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(16),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: userProvider.usersList.length,
                      itemBuilder: ((context, index) {
                        return Dismissible(
                            onDismissed: (direction) {
                              userProvider.usersList.removeAt(index);
                            },
                            key: ValueKey(userProvider.usersList[index]),
                            child: EmployersItemModel(user: userProvider.usersList[index]));
                      })),
                ),
              UserStatus.loading => const Center(child: CircularProgressIndicator())
            }
          ],
        ),
      ),
    );
  }
}
