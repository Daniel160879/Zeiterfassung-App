import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/image_logo.dart';
import 'package:meine_zeiterfassungs_app/src/config/palette.dart';
import 'package:meine_zeiterfassungs_app/src/decoration/style/decoration.dart';
import 'package:meine_zeiterfassungs_app/src/features/screens/home_startScreen/home_screen.dart';

import '../../screens/auth/Const/textfield_deco.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  Future<void> signInAndNavigate() async {
    try {
      if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
        const snackBar = SnackBar(
          content: Text("Fülle die offenen Felder aus"),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final snackBar = SnackBar(
        content: Text(e.code),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void resetPassword() {
    _auth.sendPasswordResetEmail(email: email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 80, 73, 72),
        title: const Text(
          'Login Screen',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: myBoxdeco,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(children: [
                const SizedBox(
                  height: 45,
                ),
                const MyLogo(),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  onChanged: (value) => setState(() => email = value),
                  textAlignVertical: TextAlignVertical.center,
                  controller: _emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: myEmailFieldDeco,
                ),
                TextField(
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  onChanged: (value) => setState(() => password = value),
                  textAlignVertical: TextAlignVertical.center,
                  controller: _passwordController,
                  style: const TextStyle(color: Colors.white),
                  decoration: myPasswordFieldDeco,
                ),
                const SizedBox(
                  height: 22,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 400,
                  height: 33,
                  color: const Color.fromARGB(0, 33, 149, 243),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          resetPassword();
                        },
                        child: const Text(
                          'passwort vergessen?',
                          style: TextStyle(color: Colors.white24),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(Palette.standardAppColor),
                  ),
                  onPressed: () async {
                    if (_auth.currentUser == null) {
                      await signInAndNavigate();
                      const CircularProgressIndicator();
                    } else if (_auth.currentUser != null) {
                      if (!context.mounted) return;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const HomeScreen();
                      }));
                    } else {
                      const CircularProgressIndicator();
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
