import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/image_logo.dart';
import 'package:meine_zeiterfassungs_app/screens/reg_login/Const/textfield_deco.dart';
import 'package:meine_zeiterfassungs_app/screens/reg_login/Reg%20und%20Log%20Screen/login_screen.dart';
import '../../../decoration/style/decoration.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({
    super.key,
  });

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  bool isAdmin = false;

  void signUp() async {
    if (firstName.isEmpty || lastName.isEmpty || email.isEmpty || password.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          backgroundColor: const Color.fromARGB(255, 80, 73, 72),
          content: const Text(
            'Fülle die offenen Felder aus',
            style: TextStyle(color: Colors.white, fontSize: 24, fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.backspace_outlined,
                size: 20,
                color: Colors.red,
              ),
            )
          ],
        ),
      );
    }
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if (newUser.user != null) {
        await newUser.user!.updateDisplayName('$firstName $lastName');
        await newUser.user!.reload();

        await _firestore.collection('user').doc(newUser.user!.uid).set({
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 80, 73, 72),
        title: const Text(
          'Registration Screen',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: myBoxdeco,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const MyLogo(),
                  const SizedBox(
                    height: 22,
                  ),
                  TextField(
                    onChanged: (value) => setState(() => firstName = value),
                    textAlignVertical: TextAlignVertical.center,
                    style: const TextStyle(color: Colors.white),
                    decoration: myFirstNameFieldDeco,
                  ),
                  TextField(
                    onChanged: (value) => setState(() => lastName = value),
                    textAlignVertical: TextAlignVertical.center,
                    style: const TextStyle(color: Colors.white),
                    decoration: myLastNameFieldDeco,
                  ),
                  TextField(
                    onChanged: (value) => setState(() => email = value),
                    textAlignVertical: TextAlignVertical.center,
                    style: const TextStyle(color: Colors.white),
                    decoration: myEmailFieldDeco,
                  ),
                  TextField(
                    onChanged: (value) => setState(() => password = value),
                    textAlignVertical: TextAlignVertical.center,
                    style: const TextStyle(color: Colors.white),
                    decoration: myPasswordFieldDeco,
                  ),
                  const SizedBox(
                    height: 42,
                  ),
                  ElevatedButton(
                    style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 80, 73, 72))),
                    onPressed: () {
                      signUp();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ));
                    },
                    child: const Text('Registrier dich'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
