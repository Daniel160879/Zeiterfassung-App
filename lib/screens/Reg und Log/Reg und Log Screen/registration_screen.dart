import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/Konstanten/Style/decoration.dart';
import 'package:meine_zeiterfassungs_app/image_logo.dart';
import 'package:meine_zeiterfassungs_app/screens/Reg%20und%20Log/Const/textfield_deco.dart';
import 'package:meine_zeiterfassungs_app/screens/Reg%20und%20Log/Reg%20und%20Log%20Screen/login_screen.dart';

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

  @override
  void dispose() {
    super.dispose();
    _emailController.clear();
    _passwordController.clear();
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
                      style:
                          const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 80, 73, 72))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ));
                      },
                      child: const Text(
                        'Registration',
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            ]),
          ),
        ));
  }
}
