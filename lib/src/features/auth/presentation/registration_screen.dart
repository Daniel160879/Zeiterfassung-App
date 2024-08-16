import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/image_logo.dart';
import 'package:meine_zeiterfassungs_app/src/decoration/style/decoration.dart';
import 'package:meine_zeiterfassungs_app/src/decoration/theme/theme.dart';
import 'package:meine_zeiterfassungs_app/src/features/auth/presentation/login_screen.dart';
import 'package:meine_zeiterfassungs_app/src/features/screens/auth/Const/textfield_deco.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({
    super.key,
  });

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  Future<void> signUp() async {
    if (firstName.isEmpty || lastName.isEmpty || email.isEmpty || password.isEmpty) {
      const snackBar = SnackBar(
        content: Text("Fülle die offenen Felder aus"),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      try {
        final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        if (newUser.user != null) {
          newUser.user!.sendEmailVerification();
          await newUser.user!.updateDisplayName('$firstName $lastName');
          await newUser.user!.reload();

          await _firestore.collection('user').doc(newUser.user!.uid).set({
            'firstName': firstName,
            'lastName': lastName,
            'email': email,
            'isAdmin': false,
          });
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 80, 73, 72),
        title: const Text('Registrierung', style: myBttnTextStyle),
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
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    onChanged: (value) => setState(() => firstName = value),
                    controller: _firstNameController,
                    textAlignVertical: TextAlignVertical.center,
                    style: const TextStyle(color: Colors.white),
                    decoration: myFirstNameFieldDeco,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    onChanged: (value) => setState(() => lastName = value),
                    controller: _lastNameController,
                    textAlignVertical: TextAlignVertical.center,
                    style: const TextStyle(color: Colors.white),
                    decoration: myLastNameFieldDeco,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    onChanged: (value) => setState(() => email = value),
                    controller: _emailController,
                    textAlignVertical: TextAlignVertical.center,
                    style: const TextStyle(color: Colors.white),
                    decoration: myEmailFieldDeco,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    onChanged: (value) => setState(() => password = value),
                    controller: _passwordController,
                    textAlignVertical: TextAlignVertical.center,
                    style: const TextStyle(color: Colors.white),
                    decoration: myPasswordFieldDeco,
                  ),
                  const SizedBox(
                    height: 42,
                  ),
                  ElevatedButton(
                    style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 80, 73, 72))),
                    onPressed: () async {
                      await signUp();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                      _firstNameController.clear();
                      _lastNameController.clear();
                      _emailController.clear();
                      _passwordController.clear();
                    },
                    child: const Text(
                      'Registrier dich',
                      style: TextStyle(color: Colors.white),
                    ),
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
