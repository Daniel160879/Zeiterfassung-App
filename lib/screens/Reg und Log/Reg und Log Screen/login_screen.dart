import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/image_logo.dart';
import 'package:meine_zeiterfassungs_app/screens/Home%20+%20StartScreen/home_screen.dart';
import 'package:meine_zeiterfassungs_app/screens/Reg%20und%20Log/Widget/widget_email_textfield.dart';
import 'package:meine_zeiterfassungs_app/screens/Reg%20und%20Log/Widget/widget_password_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/background/background.png',
                ),
                fit: BoxFit.cover),
          ),
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
                  const MyEmailTextField(),
                  const SizedBox(
                    height: 22,
                  ),
                  const MyPasswordTextField(),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 400,
                    height: 33,
                    color: const Color.fromARGB(0, 33, 149, 243),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
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
                    style:
                        const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 80, 73, 72))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const HomeScreen()),
                        ),
                      );
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
        ));
  }
}
