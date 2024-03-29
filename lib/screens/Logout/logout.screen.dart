import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/const/theme/theme.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/background/background.png'), fit: BoxFit.cover),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/Feierabend.png'),
                  Image.asset('assets/images/ausgestempelt.png'),
                  ElevatedButton(
                      style: const ButtonStyle(
                        alignment: Alignment.center,
                        backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 80, 73, 72),
                        ),
                      ),
                      onPressed: () {
                        exit(0);
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
