import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/constants/theme/theme.dart';
import 'package:meine_zeiterfassungs_app/screens/reg_login/Reg%20und%20Log%20Screen/login_screen.dart';
import 'package:meine_zeiterfassungs_app/screens/reg_login/Reg%20und%20Log%20Screen/registration_screen.dart';

import '../../constants/Style/decoration.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 80, 73, 72),
        title: const Text(
          'StartScreen',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: myBoxdeco,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/images/logo1.png'),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 80, 73, 72)),
                  fixedSize: MaterialStatePropertyAll(
                    Size(200, 45),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegistrationScreen(),
                      ));
                },
                child: const Text(
                  'Registrierung',
                  style: myBttnTextStyle,
                ),
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 80, 73, 72)),
                  fixedSize: MaterialStatePropertyAll(
                    Size(200, 45),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                },
                child: const Text(
                  'Login',
                  style: myBttnTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
