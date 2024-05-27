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
  final _emailController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');
  bool showLoading = false;
  bool longEnought = false;
  String specialCharacters = '!@#\$%^&*(),.?":{}|<>';
  bool hasSpecialCharacter = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.clear();
    _passwordController.clear();
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        backgroundColor: const Color.fromARGB(255, 80, 73, 72),
        content: Text(
          message,
          style: const TextStyle(color: Colors.white, fontSize: 24, fontStyle: FontStyle.italic),
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
              child: ListView(children: [
                Column(children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const MyLogo(),
                  const SizedBox(
                    height: 22,
                  ),
                  TextField(
                    textAlignVertical: TextAlignVertical.center,
                    controller: _emailController,
                    style: const TextStyle(color: Colors.white),
                    decoration: myEmailFieldDeco,
                  ),
                  TextField(
                    textAlignVertical: TextAlignVertical.center,
                    controller: _passwordController,
                    style: const TextStyle(color: Colors.white),
                    decoration: myPasswordFieldDeco,
                  ),
                  const SizedBox(
                    height: 42,
                  ),
                  ElevatedButton(
                    style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 80, 73, 72))),
                    onPressed: () {
                      if (_emailController.text.isEmpty && _passwordController.text.isEmpty) {
                        showErrorDialog('Bitte gib deine Email Adresse ein!!');
                      } else if (_emailController.text.length <= 8) {
                        showErrorDialog('Dein Passwort ist nicht lang genug!!');
                      } else {
                        try {
                          setState(() {
                            showLoading = true;
                            longEnought = true;
                            hasSpecialCharacter = true;
                          });

                          FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: _emailController.text, password: _passwordController.text);
                        } catch (error) {
                          showDialog(
                              context: context,
                              builder: (context) => const AlertDialog(
                                    title: Text('ERROR'),
                                    backgroundColor: Color.fromARGB(255, 80, 73, 72),
                                  ));
                        } finally {
                          setState(() {
                            showLoading = false;
                            longEnought = false;
                            hasSpecialCharacter = false;
                          });
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ));
                      }
                    },
                    child: const Text('Registrier dich'),
                  ),
                ]),
              ]),
            )));
  }
}
