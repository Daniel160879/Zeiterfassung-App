import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/decoration/style/decoration.dart';
import 'package:meine_zeiterfassungs_app/decoration/theme/theme.dart';
import 'package:meine_zeiterfassungs_app/image_logo.dart';
import 'package:meine_zeiterfassungs_app/screens/auth/Reg%20und%20Log%20Screen/login_screen.dart';
import 'package:meine_zeiterfassungs_app/screens/auth/Reg%20und%20Log%20Screen/registration_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: myBoxdeco,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const MyLogo(),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 80, 73, 72)),
                  fixedSize: WidgetStatePropertyAll(
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
                  backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 80, 73, 72)),
                  fixedSize: WidgetStatePropertyAll(
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
