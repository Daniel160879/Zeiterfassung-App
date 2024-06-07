import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/decoration/buttonStyle/button_styles.dart';
import 'package:meine_zeiterfassungs_app/decoration/style/decoration.dart';
import 'package:meine_zeiterfassungs_app/decoration/theme/theme.dart';
import 'package:meine_zeiterfassungs_app/screens/auth/Reg%20und%20Log%20Screen/login_screen.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 80, 73, 72),
          title: const Text(
            'Logout',
            style: myAppBarTextStyle,
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: myBoxdeco,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/Feierabend.png'),
                  Image.asset('assets/images/ausgestempelt.png'),
                  ElevatedButton(
                      style: myHomeButtonStyle,
                      onPressed: () {
                        auth.signOut();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        'Logout',
                        style: myBttnTextStyle,
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
