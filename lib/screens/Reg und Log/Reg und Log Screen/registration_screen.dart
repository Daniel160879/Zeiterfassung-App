import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/image_logo.dart';
import 'package:meine_zeiterfassungs_app/screens/Reg%20und%20Log/Widget/widget_email_textfield.dart';
import 'package:meine_zeiterfassungs_app/screens/Reg%20und%20Log/Widget/widget_password_textfield.dart';

import 'package:meine_zeiterfassungs_app/screens/Reg%20und%20Log/Reg%20und%20Log%20Screen/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key, required this.user});

  final String user;

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/background/background.png',
                ),
                fit: BoxFit.fill),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: ListView(children: [
              Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Text(widget.user),
                  const MyLogo(),
                  const MyEmailTextField(),
                  const SizedBox(
                    height: 22,
                  ),
                  const MyPasswordTextField(),
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
