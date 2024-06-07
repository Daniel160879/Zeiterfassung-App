import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/image_logo.dart';
import '../../../decoration/style/decoration.dart';
import '../Const/textfield_deco.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');
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

  void signInAndNavigate() async {
    try {
      if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
        const snackBar = SnackBar(
          content: Text("Fülle die offenen Felder aus"),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        await _auth.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
      }
    } on FirebaseAuthException catch (e) {
      Text(e.code);
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
                  onChanged: (value) => setState(() => email = value),
                  textAlignVertical: TextAlignVertical.center,
                  controller: _emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: myEmailFieldDeco,
                ),
                TextField(
                  onChanged: (value) => setState(() => email = value),
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
                    backgroundColor: WidgetStatePropertyAll(
                      Color.fromARGB(255, 80, 73, 72),
                    ),
                  ),
                  onPressed: () {
                    signInAndNavigate();
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
