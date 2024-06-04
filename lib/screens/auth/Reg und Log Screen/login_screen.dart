import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/image_logo.dart';
import 'package:meine_zeiterfassungs_app/provider/user_provider.dart';
import 'package:meine_zeiterfassungs_app/screens/home_startScreen/home_screen.dart';
import 'package:provider/provider.dart';
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
    final currentId = _auth.currentUser!.uid;
    context.read<UserProvider>().loadCurrentUser(currentId);
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void signInAndNavigate() async {
    try {
      final userCredential =
          await _auth.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
      if (userCredential.user!.emailVerified) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      }
    } on FirebaseAuthException catch (e) {
      print(e);
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
